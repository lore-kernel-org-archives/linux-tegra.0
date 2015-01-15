From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2] conf/ucm: GoogleNyan: Add configuration
Date: Thu, 15 Jan 2015 17:27:29 +0100
Message-ID: <1421339249-27815-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Taken from the ChromeOS sources, this configuration should apply to all
Nyan boards from Google, so far HP Chromebook 14 (nyan-blaze) and Acer
Chromebook 13 (nyan-big).

Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

---

The board name matches what is proposed in this patch:

http://article.gmane.org/gmane.linux.ports.arm.kernel/386036

v2:	* Fix whitespace
	* Remove ChromeOS-specific stuff
	* Use Headphones control instead of HP Left/Right Out
---
 configure.ac                            |  1 +
 src/conf/ucm/GoogleNyan/GoogleNyan.conf |  5 +++
 src/conf/ucm/GoogleNyan/HiFi.conf       | 77 +++++++++++++++++++++++++++++++++
 src/conf/ucm/GoogleNyan/Makefile.am     |  4 ++
 src/conf/ucm/Makefile.am                |  2 +-
 5 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 src/conf/ucm/GoogleNyan/GoogleNyan.conf
 create mode 100644 src/conf/ucm/GoogleNyan/HiFi.conf
 create mode 100644 src/conf/ucm/GoogleNyan/Makefile.am

diff --git a/configure.ac b/configure.ac
index 734163c..916280b 100644
--- a/configure.ac
+++ b/configure.ac
@@ -654,6 +654,7 @@ AC_OUTPUT(Makefile doc/Makefile doc/pictures/Makefile doc/doxygen.cfg \
 	  src/conf/ucm/SDP4430/Makefile \
 	  src/conf/ucm/tegraalc5632/Makefile \
 	  src/conf/ucm/PAZ00/Makefile \
+	  src/conf/ucm/GoogleNyan/Makefile \
 	  modules/Makefile modules/mixer/Makefile modules/mixer/simple/Makefile \
 	  alsalisp/Makefile aserver/Makefile \
 	  test/Makefile test/lsb/Makefile \
diff --git a/src/conf/ucm/GoogleNyan/GoogleNyan.conf b/src/conf/ucm/GoogleNyan/GoogleNyan.conf
new file mode 100644
index 0000000..efe6ad8
--- /dev/null
+++ b/src/conf/ucm/GoogleNyan/GoogleNyan.conf
@@ -0,0 +1,5 @@
+Comment "Nyan internal card"
+SectionUseCase."HiFi" {
+	File "HiFi.conf"
+	Comment "Default"
+}
diff --git a/src/conf/ucm/GoogleNyan/HiFi.conf b/src/conf/ucm/GoogleNyan/HiFi.conf
new file mode 100644
index 0000000..b28fe91
--- /dev/null
+++ b/src/conf/ucm/GoogleNyan/HiFi.conf
@@ -0,0 +1,77 @@
+SectionVerb {
+	EnableSequence [
+		cdev "hw:GoogleNyan"
+		cset "name='Left Speaker Mixer Left DAC Switch' on"
+		cset "name='Right Speaker Mixer Right DAC Switch' on"
+		cset "name='Headphone Left Switch' on"
+		cset "name='Headphone Right Switch' on"
+		cset "name='Digital EQ 3 Band Switch' off"
+		cset "name='Digital EQ 5 Band Switch' off"
+		cset "name='Digital EQ 7 Band Switch' off"
+		cset "name='Biquad Switch' off"
+		cset "name='Filter Mode' Music"
+		cset "name='ADC Oversampling Rate' 0"
+		cset "name='DMIC Mux' DMIC"
+		cset "name='MIC2 Mux' IN34"
+		cset "name='Right ADC Mixer MIC2 Switch' on"
+		cset "name='Left ADC Mixer MIC2 Switch' on"
+		cset "name='MIC2 Volume' 10"
+		cset "name='MIC2 Boost Volume' 0"
+		cset "name='Mic Jack Switch' off"
+		cset "name='Int Mic Switch' on"
+		cset "name='ADCR Boost Volume' 4"
+		cset "name='ADCL Boost Volume' 4"
+		cset "name='ADCR Volume' 11"
+		cset "name='ADCL Volume' 11"
+		cset "name='Left Speaker Mixer Left DAC Switch' on"
+		cset "name='Right Speaker Mixer Right DAC Switch' on"
+		cset "name='Speaker Left Mixer Volume' 2"
+		cset "name='Speaker Right Mixer Volume' 2"
+		cset "name='Record Path DC Blocking' on"
+		cset "name='Playback Path DC Blocking' on"
+		cset "name='Headphone Left Switch' on"
+		cset "name='Headphone Right Switch' on"
+		cset "name='Headphones Switch' off"
+		cset "name='Speaker Left Switch' on"
+		cset "name='Speaker Right Switch' on"
+		cset "name='Speakers Switch' on"
+	]
+	DisableSequence [
+	]
+}
+
+SectionDevice."Headphone".0 {
+	Value {
+		OutputDspName ""
+	}
+	EnableSequence [
+		cdev "hw:GoogleNyan"
+		cset "name='Speakers Switch' off"
+		cset "name='Headphones Switch' on"
+	]
+	DisableSequence [
+		cdev "hw:GoogleNyan"
+		cset "name='Headphones Switch' off"
+		cset "name='Speakers Switch' on"
+	]
+}
+
+SectionDevice."Mic".0 {
+	Value {
+		CaptureControl "MIC2"
+	}
+	EnableSequence [
+		cdev "hw:GoogleNyan"
+		cset "name='Int Mic Switch' off"
+		cset "name='DMIC Mux' ADC"
+		cset "name='Mic Jack Switch' on"
+		cset "name='Record Path DC Blocking' on"
+	]
+	DisableSequence [
+		cdev "hw:GoogleNyan"
+		cset "name='Mic Jack Switch' off"
+		cset "name='DMIC Mux' DMIC"
+		cset "name='Int Mic Switch' on"
+		cset "name='Record Path DC Blocking' off"
+	]
+}
diff --git a/src/conf/ucm/GoogleNyan/Makefile.am b/src/conf/ucm/GoogleNyan/Makefile.am
new file mode 100644
index 0000000..47c7fc9
--- /dev/null
+++ b/src/conf/ucm/GoogleNyan/Makefile.am
@@ -0,0 +1,4 @@
+alsaconfigdir = @ALSA_CONFIG_DIR@
+ucmdir = $(alsaconfigdir)/ucm/GoogleNyan
+ucm_DATA = GoogleNyan.conf HiFi.conf
+EXTRA_DIST = $(ucm_DATA)
diff --git a/src/conf/ucm/Makefile.am b/src/conf/ucm/Makefile.am
index bde89df..14fc7ae 100644
--- a/src/conf/ucm/Makefile.am
+++ b/src/conf/ucm/Makefile.am
@@ -1 +1 @@
-SUBDIRS=DAISY-I2S PandaBoard PandaBoardES SDP4430 tegraalc5632 PAZ00
+SUBDIRS=DAISY-I2S PandaBoard PandaBoardES SDP4430 tegraalc5632 PAZ00 GoogleNyan
-- 
1.9.3
