% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/autoExtract.R
\name{autoExtract}
\alias{autoExtract}
\title{Automatically analyze audio files}
\usage{
autoExtract(
  path = ".",
  audioList = list(),
  filter = NA,
  fileType = "wav",
  fileNamePattern = "ID_Condition_Dimension",
  sep = "_",
  parallel = FALSE,
  recursive = FALSE,
  preprocess = FALSE,
  extended = FALSE,
  ...
)
}
\arguments{
\item{path}{An optional character string indicating the path to the folder containing the audio files. Default corresponds to the current working directory. (You should only define it if the audios you wish to analyze are not already read in R. Otherwise define the audioList parameter).}

\item{audioList}{An optional list of Wave objects to analyze.}

\item{filter}{An optional character vector indicating IDs, Conditions, Dimensions, or other patterns used to filter for specific audio files. Default corresponds to NA.}

\item{fileType}{A character string indicating the audio file format (wav or mp3). Default corresponds to wav.}

\item{fileNamePattern}{A character string indicating the naming format of the audio files, such as "ID-Condition-Dimension", "Condition_ID_Dimension" or just "ID". Default corresponds to "ID".}

\item{sep}{A non alpha-numeric character that acts as separator between the different naming components. Default corresponds to an underscore. This field can be ignored if the audio file name only contains an ID component.}

\item{parallel}{Logical value indicating whether to use parallelism to extract the different audio characteristics to enhance computational performance. Default corresponds to FALSE.}

\item{recursive}{Logical value indicating whether subdirectories in the specified directory should be included when searching for voice files. Default corresponds to FALSE.}

\item{preprocess}{Logical value indicating whether to preprocess (normalize amplitude and remove background noise) the audio files before extraction and analysis. Default corresponds to FALSE.}

\item{extended}{Logical value indicating whether all features extracted by the soundgen package should be inputted. Default corresponds to FALSE.}

\item{...}{Other options used to control preprocessing behavior.}
}
\value{
A data.frame is created with the following audio features:
\describe{
  \item{duration}{Total duration in seconds.}
  \item{voice_breaks_percent}{Proportion of unvoiced frames.}
  \item{RMS_env}{Root mean square of the amplitude envelope.}
  \item{mean_loudness}{Average subjective loudness in sone.}
  \item{mean_F0}{Average fundamental frequency in Hertz.}
  \item{sd_F0}{Standard deviation of the fundamental frequency in Hertz.}
  \item{mean_entropy}{Average Wiener entropy. A value of 0 indicates a pure tone, while a value of 1 indicates white noise.}
  \item{mean_HNR}{Average Harmonics-to-Noise Ratio.}
  \item{ID}{ID component of the audio file.}
  \item{Condition}{If fileNamePattern and audio names include a Condition, an additional column with the Condition component of the audio file is included.}
  \item{Dimension}{If fileNamePattern and audio names include a Dimension, an additional column with the Dimension component of the audio file is included.}
}
}
\description{
Automatically analyzes audio files and outputs a data.frame with their main extracted audio features.
}
\details{
The voiceR package requires the audio file names to follow a specific pattern, in which the different components are separated by a non alphanumeric character (e.g., “_”). File name components refer to:
\describe{
  \item{ID}{Unique identifier of the speaker or recording.}
  \item{Condition}{Experimental condition or other grouping variable.}
  \item{Dimension}{Additional survey or experiment information (e.g., additional conditions).}
}
Order and presence of the different components is not important, as long as at least one of the aforementioned components is present.
Furthermore, non-relevant components can be skipped by specifying “Null” in its position such as: ID_Null_Condition. Valid name patterns are, for example, 876h Interior (ID Condition), Exterior-3543h (Condition-ID), 983b-Exterior-q1 (ID-Condition-Dimension) or 455k (ID). All voice files within one session need to follow the same file naming pattern.
Note: the non-alpha numeric separator should also be specified as sep.
}
\examples{
\donttest{
audioData <- autoExtract(audioList = testAudioList, filter = c("5b438f516066ad470d3be72c52005251"))
}

}
\seealso{
[soundgen::analyze()], [seewave::duration()], [seewave::rms()], [seewave::env()]
}
