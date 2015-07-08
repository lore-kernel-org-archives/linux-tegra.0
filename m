From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFT PATCH 1/2] i2c: tegra: update CONFIG_LOAD for new conifiguration
Date: Wed, 08 Jul 2015 14:36:40 -0600
Message-ID: <559D89D8.50500@wwwdotorg.org>
References: <1435661667-11554-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435661667-11554-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrewc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/30/2015 04:54 AM, Laxman Dewangan wrote:
> Once the new configuration is set on the conifg register of
> I2C controller, it is require to update the CONFIG_LOAD register
> to transfer the new SW configuration to actual HW internal
> registers that would be used in the actual logic.
>
> It is like, SW is programming only shadow registers through
> regular configuration and when these load_config bit fields
> are set to 1, it causes the regular/shadows registers
> configuration transferred to the HW internal active registers.
> So SW has to set these bit fields at the end of all regular
> registers configuration. And these config_load bits are HW
> auto-clear bits. HW clears these bit fields once the register
> configuration is moved to HW internal active registers. So SW
> has to wait until these bits are auto-cleared before going
> for any further programming
>
> This mechanism is supported on T124 and after this SoCs.
>
> This is based on change done by
> 	Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I'm not sure why Chaitanya's S-o-b is there and listed last if he's not 
the patch author. If he wrote the patch, he should be the git author and 
his S-o-b should be first. If he didn't and you simply based this patch 
on work by Chaitanya, then his S-o-b probably shouldn't be present, and 
yours would be last since you're submitting the patch.

> ---
> Stephen/Andrew,
> I need help on testing this on other platform. I tested this on T210.

I'm puzzled how this was tested on T210, since it isn't supported 
upstream yet.

The series,
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(Tested audio playback and volume adjustment on Jetson TK1 which 
contains a Tegra124 SoC)
