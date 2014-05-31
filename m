From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Fri, 30 May 2014 18:45:13 -0700
Message-ID: <CAEUnVG52fJhd9213fdydoUW11N0yZ31T2MZ2BPmd5Q2xkZ8XeQ@mail.gmail.com>
References: <CAEUnVG7+=1ko8NL1Z3ovSpGveUADUidy4sBhU_dTUe1zbe-bMA@mail.gmail.com>
 <537BCF39.6050909@wwwdotorg.org> <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ@mail.gmail.com>
 <20140521205538.GA6237@mithrandir> <CAEUnVG7tDjw_6wHc=FN0KsOKsSS1u8H8SzYdxt9VCwUsARRTeQ@mail.gmail.com>
 <20140522094958.GA11585@ulmo> <CAEUnVG5pNMzDoXGso+UiAWPpD0hNPhBPyGr8KfV587AuU70QPQ@mail.gmail.com>
 <537E39D9.2000304@wwwdotorg.org> <CAEUnVG4UettOj0xDy+f6qEhUbhNs=u-wgyCf_Prsd2JpnmFfLw@mail.gmail.com>
 <CAEUnVG42Fmn4QOu-jObpoyViscmfKn35oDmb=WR8t=X7YVSB=Q@mail.gmail.com>
 <537F9BEB.5020102@wwwdotorg.org> <CAEUnVG63BCgpGuo+qcYkvpnVSSguBy9xwSC_AoZqCt1RgBqm7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEUnVG63BCgpGuo+qcYkvpnVSSguBy9xwSC_AoZqCt1RgBqm7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 23, 2014 at 1:34 PM, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Fri, May 23, 2014 at 12:05 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 05/22/2014 09:55 PM, Dylan Reid wrote:
>> ...
>>>>>>>>>> On Tue, May 20, 2014 at 2:55 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> ...
>>>>>>>>>>> Now I have the same results as Thierry; speaker-test looks like it
>>>>>>>>>>> should be working, yet I don't hear any audio from the monitor. I know
>>>>>>>>>>> the monitor works, since I've used it extensively for testing GeForce
>>>>>>>>>>> GPU HDMI audio.
>> ...
>>> Took all day, but I did get to try this.
>>>
>>> on U-Boot commit d7782d0, flashed with Stephen's u-boot flasher from github.
>>>
>>> And kernel at 81d0207 - ARM: tegra: enable HD-Audio controller in defconfig
>>> plus the addition of the hda node "okay"  to the jetson-tk1 DT.
>>>
>>> I can hear the jetson's audio on the TV.  This is currently a sample
>>> size of one TV, I'll set up the Quantum Data tomorrow and check that
>>> it works there as well.
>>
>> I tried that same U-Boot commit (with a few device-mode USB patches on
>> top that shouldn't affect anything since I didn't use USB device mode)
>> and have the same results.
>>
>> My monitor is a Dell U2410 with sound bar.

I found one of these.  I also didn't hear any audio.  In fact I
couldn't get audio out of most monitors, TV sets worked fine.

hdmi.c couldn't configure audio for the pixel clock generated for the
monitor.  Luckily I found a patch in our downstream tree that fixes
it.

video: tegra: Calculate HDMI audio CTS/N/AVAL values -- 7/25/11 author
swarren =)

Thanks for fixing this for me!

I can send this up unless you'd rather send it yourself.

I appended the patch moved to the new location of hdmi.c:

video: tegra: Calculate HDMI audio CTS/N/AVAL values

The current table-drive approach for determining the CTS/N/AVAL values
required for HDMI audio limits audio availability to a small set of
pixel clock frequencies. Allow audio in other cases by calculating the
CTS and N value dynamically where the tables don't contain
pre-calculated values.

---
 drivers/gpu/drm/tegra/hdmi.c | 143 +++++++++++--------------------------------
 1 file changed, 35 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index fec1a63..453e515 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -9,6 +9,7 @@

 #include <linux/clk.h>
 #include <linux/debugfs.h>
+#include <linux/gcd.h>
 #include <linux/hdmi.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -104,61 +105,34 @@ struct tegra_hdmi_audio_config {
        unsigned int aval;
 };

-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_32k[] = {
-       {  25200000, 4096,  25200, 24000 },
-       {  27000000, 4096,  27000, 24000 },
-       {  74250000, 4096,  74250, 24000 },
-       { 148500000, 4096, 148500, 24000 },
-       {         0,    0,      0,     0 },
-};
-
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_44_1k[] = {
-       {  25200000, 5880,  26250, 25000 },
-       {  27000000, 5880,  28125, 25000 },
-       {  74250000, 4704,  61875, 20000 },
-       { 148500000, 4704, 123750, 20000 },
-       {         0,    0,      0,     0 },
-};
-
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_48k[] = {
-       {  25200000, 6144,  25200, 24000 },
-       {  27000000, 6144,  27000, 24000 },
-       {  74250000, 6144,  74250, 24000 },
-       { 148500000, 6144, 148500, 24000 },
-       {         0,    0,      0,     0 },
-};
-
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_88_2k[] = {
-       {  25200000, 11760,  26250, 25000 },
-       {  27000000, 11760,  28125, 25000 },
-       {  74250000,  9408,  61875, 20000 },
-       { 148500000,  9408, 123750, 20000 },
-       {         0,     0,      0,     0 },
-};
-
-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_96k[] = {
-       {  25200000, 12288,  25200, 24000 },
-       {  27000000, 12288,  27000, 24000 },
-       {  74250000, 12288,  74250, 24000 },
-       { 148500000, 12288, 148500, 24000 },
-       {         0,     0,      0,     0 },
-};
+static int tegra_hdmi_calc_audio_cts_n(unsigned fs, unsigned pixel_rate,
+                                      unsigned *hda_cts, unsigned *hda_n,
+                                      unsigned *hda_aval)
+{
+       /* Ideal ACR interval is 1000 hz (1 ms) */
+       unsigned n_ideal = (128 * fs) / 1000;
+       unsigned cts = pixel_rate;
+       unsigned n = 128 * fs;
+       unsigned common_divisor = gcd(cts, n);
+       unsigned mult;
+
+       cts /= common_divisor;
+       n /= common_divisor;
+       mult = n_ideal / n;
+       if (mult) {
+               n *= mult;
+               cts *= mult;
+       }

-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_176_4k[] = {
-       {  25200000, 23520,  26250, 25000 },
-       {  27000000, 23520,  28125, 25000 },
-       {  74250000, 18816,  61875, 20000 },
-       { 148500000, 18816, 123750, 20000 },
-       {         0,     0,      0,     0 },
-};
+       if (cts < (1 << 20)) {
+               *hda_cts = cts;
+               *hda_n = n;
+               *hda_aval = 240000UL * n / (128 * fs / 100);
+               return 0;
+       }

-static const struct tegra_hdmi_audio_config tegra_hdmi_audio_192k[] = {
-       {  25200000, 24576,  25200, 24000 },
-       {  27000000, 24576,  27000, 24000 },
-       {  74250000, 24576,  74250, 24000 },
-       { 148500000, 24576, 148500, 24000 },
-       {         0,     0,      0,     0 },
-};
+       return -EINVAL;
+}

 static const struct tmds_config tegra20_tmds_config[] = {
        { /* slow pixel clock modes */
@@ -397,54 +371,6 @@ static const struct tmds_config tegra124_tmds_config[] = {
        },
 };

-static const struct tegra_hdmi_audio_config *
-tegra_hdmi_get_audio_config(unsigned int audio_freq, unsigned int pclk)
-{
-       const struct tegra_hdmi_audio_config *table;
-
-       switch (audio_freq) {
-       case 32000:
-               table = tegra_hdmi_audio_32k;
-               break;
-
-       case 44100:
-               table = tegra_hdmi_audio_44_1k;
-               break;
-
-       case 48000:
-               table = tegra_hdmi_audio_48k;
-               break;
-
-       case 88200:
-               table = tegra_hdmi_audio_88_2k;
-               break;
-
-       case 96000:
-               table = tegra_hdmi_audio_96k;
-               break;
-
-       case 176400:
-               table = tegra_hdmi_audio_176_4k;
-               break;
-
-       case 192000:
-               table = tegra_hdmi_audio_192k;
-               break;
-
-       default:
-               return NULL;
-       }
-
-       while (table->pclk) {
-               if (table->pclk == pclk)
-                       return table;
-
-               table++;
-       }
-
-       return NULL;
-}
-
 static void tegra_hdmi_setup_audio_fs_tables(struct tegra_hdmi *hdmi)
 {
        const unsigned int freqs[] = {
@@ -475,7 +401,7 @@ static void
tegra_hdmi_setup_audio_fs_tables(struct tegra_hdmi *hdmi)
 static int tegra_hdmi_setup_audio(struct tegra_hdmi *hdmi, unsigned int pclk)
 {
        struct device_node *node = hdmi->dev->of_node;
-       const struct tegra_hdmi_audio_config *config;
+       unsigned hda_n, hda_cts, hda_aval;
        unsigned int offset = 0;
        unsigned long value;

@@ -506,8 +432,9 @@ static int tegra_hdmi_setup_audio(struct
tegra_hdmi *hdmi, unsigned int pclk)
                tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_AUDIO_CNTRL0);
        }

-       config = tegra_hdmi_get_audio_config(hdmi->audio_freq, pclk);
-       if (!config) {
+       if (tegra_hdmi_calc_audio_cts_n(hdmi->audio_freq,
+                                       clk_get_rate(hdmi->clk),
+                                       &hda_cts, &hda_n, &hda_aval) < 0) {
                dev_err(hdmi->dev, "cannot set audio to %u at %u pclk\n",
                        hdmi->audio_freq, pclk);
                return -EINVAL;
@@ -516,13 +443,13 @@ static int tegra_hdmi_setup_audio(struct
tegra_hdmi *hdmi, unsigned int pclk)
        tegra_hdmi_writel(hdmi, 0, HDMI_NV_PDISP_HDMI_ACR_CTRL);

        value = AUDIO_N_RESETF | AUDIO_N_GENERATE_ALTERNATE |
-               AUDIO_N_VALUE(config->n - 1);
+               AUDIO_N_VALUE(hda_n - 1);
        tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_AUDIO_N);

-       tegra_hdmi_writel(hdmi, ACR_SUBPACK_N(config->n) | ACR_ENABLE,
+       tegra_hdmi_writel(hdmi, ACR_SUBPACK_N(hda_n) | ACR_ENABLE,
                          HDMI_NV_PDISP_HDMI_ACR_0441_SUBPACK_HIGH);

-       value = ACR_SUBPACK_CTS(config->cts);
+       value = ACR_SUBPACK_CTS(hda_cts);
        tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_HDMI_ACR_0441_SUBPACK_LOW);

        value = SPARE_HW_CTS | SPARE_FORCE_SW_CTS | SPARE_CTS_RESET_VAL(1);
@@ -563,7 +490,7 @@ static int tegra_hdmi_setup_audio(struct
tegra_hdmi *hdmi, unsigned int pclk)
                        break;
                }

-               tegra_hdmi_writel(hdmi, config->aval, offset);
+               tegra_hdmi_writel(hdmi, hda_aval, offset);
        }

        tegra_hdmi_setup_audio_fs_tables(hdmi);
-- 
1.8.1.3.605.g02339dd
