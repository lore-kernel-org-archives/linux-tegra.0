From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ALSA: hda: Enable sync-write operation as default for all
 controllers
Date: Tue, 14 Jul 2020 09:08:02 +0100
Message-ID: <8fc9f086-9a34-4287-8f51-6e0ebc34928f@nvidia.com>
References: <20200618144051.7415-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200618144051.7415-1-tiwai-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Takashi,

On 18/06/2020 15:40, Takashi Iwai wrote:
> In the end we already enabled the sync-write mode for most of HD-audio
> controllers including Intel, and it's no big merit to keep the async
> write mode for the rest.  Let's make it as default and drop the
> superfluous AZX_DCAPS_SYNC_WRITE bit flag.
> 
> Also, avoid to set the allow_bus_reset flag, which is a quite unstable
> and hackish behavior that was needed only for some early platforms
> (decades ago).  The straight fallback to the single cmd mode is more
> robust.
> 
> Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>


I have noticed a regression in HDA playback on our Tegra186 Jetson TX2
platform. Bisect is pointing to this patch and reverting this does
appear to fix it. Interestingly, I am not seeing any problems on other
Tegra platforms, however, Tegra186 does have the IOMMU enabled for HDA
which is one different between the other platforms.

We can take a closer look at this for Tegra, but I am wondering if we
revert this for Tegra for now.

Cheers
Jon

-- 
nvpublic
