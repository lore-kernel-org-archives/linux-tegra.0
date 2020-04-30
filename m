From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC] DPCM for Tegra
Date: Thu, 30 Apr 2020 18:11:23 +0530
Message-ID: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Mark,

Earlier I had sent Tegra ASoC series [0] for review and writing back
to follow up on the same.


Background
==========
There were following concerns on [0]:

 - Usage of mixer control overrides in each driver for PCM parameters.

 - Exposure of routing controls to the user.

The comments are mostly captured in [1] and [2].

There was a suggestion to use DPCM for the Tegra audio requirements.

Note: As of now, below does not cover specific solution for propogation
of audio configurations or PCM parameters (like sample rate, sample size
and channels).

DPCM Testing
============
Since then I was looking into internals of DPCM and was trying to get it
working with Tegra. I was able to get following things working.

 - Audio playback/capture over I2S/DMIC/DSPK.
 - Audio resampling use case.
 - Mixing of two audio streams with resampler in the path.

Objective was to understand and get audio working with DPCM. Please note
that I used simple-card DPCM driver for a quick testing on top of the above
Tegra Audio series. I had to tweak the simple-card driver a little, but
currently keeping it out of the scope of current discussion.

At a high level Tegra Audio HW is depicted as below.

|     Front End PCMs     |  SoC DSP   |     Back End DAIs    |

                         *************
ADMAIF<0> <------------> *           * <----DAI<0>-----> I2S
                         *           *
ADMAIF<1> <------------> *           * <----DAI<1>-----> DMIC
                         *    XBAR   *
ADMAIF<2> <------------> *           * <----DAI<2>-----> DSPK
                         *           *
ADMAIF<N> <------------> *           * <----DAI<3>-----> SFC (Resampler)
                         *           *
                         *           * <----DAI<4>-----> MIXER
                         *           *
                         *           * <----DAI<N>-----> ...
                         *************

Note:
-----

 * XBAR is just a cross bar interconnecting one component to another.
   Specific switch needs to be programmed for audio data to flow from
   one component to another.

 * SFC or Mixer are separate HW blocks and separate ASoC drivers are
   written for these. These drivers were not sent earlier as part of
   initial upstream series [0].


Follow up queries
=================
Based on the above experience I do have few follow up queries and request
for your inputs on this.

 a) Can I use a DAPM Mux control to activate a BE path? This in turn can
    program required switch in XBAR.

    This is needed for following reasons:

    - For an open platform like Jetson, we want to give maximum flexibility
      for a user to customize their audio paths. Number of connected
      components and order of these can vary depending on a use case.

    - Allow re-use of audio components across multiple use cases.
      For example, number of SFC instances are lesser than PCM playback or
      capture devices.

 b) I have modelled SFC and MIXER as backends. Is this allowed?

    This was done to include SFC or MIXER HW components as part of the
    sound card and use like below in one of the audio use cases.
 
    ADMAIF1(FE) --> SFC(BE1) --> I2S(BE2) ... OR
    ADMAIF2(FE) --> SFC(BE1) --> I2S(BE2) ...

    I used following workaround to connect multiple BE components.
    With this I can see PCM callbacks happen for all BE DAIs along the DAPM
    path. The obective was to connect multiple components together and (a)
    was used to connect one component to another. Each "-->" here connects
    two components and it is a switch in XBAR. 

    ---
      sound/soc/soc-pcm.c | 2 +-
      1 file changed, 1 insertion(+), 1 deletion(-)

      diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
      index e256d43..ee7af55 100644
      --- a/sound/soc/soc-pcm.c
      +++ b/sound/soc/soc-pcm.c
      @@ -1494,7 +1494,7 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 
 	  /* get number of valid DAI paths and their widgets */
 	  paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
      -			dpcm_end_walk_at_be);
      +			NULL);
 
 	dev_dbg(fe->dev, "ASoC: found %d audio %s paths\n", paths,
 			stream ? "capture" : "playback");
    -- 

 c) Hostless mode did NOT work:
     - Following audio path was intended to be tested:
       I2S1 --> SFC --> I2S2

     - [3] offers two options:
         * CODEC<->CODEC: If I were to use a separate DAI link for each BE to BE
           connection, then it will result in a similar design what we have
           currently.

         * Hostless: I did not come across references for this.
           (Any references in this regard will be helpful)


May be the current Tegra ASoC design is more suitable for component model as you
had previously mentioned. I wanted to understand if above, especially (a) and (b),
are acceptable in this regard or if there are better options to interconnect
multiple ASoC components.

Looking forward for your feedback.

Thanks,
Sameer.

References
==========
[0] http://patchwork.ozlabs.org/project/linux-tegra/list/?series=159664&archive=both&state=*
[1] http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-6-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/
[2] http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-4-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/
[3] https://www.kernel.org/doc/html/v5.6/sound/soc/dpcm.html
