From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: tegra20: Remove obsolete nvidia,vbus-gpio
 properties
Date: Tue, 16 Jul 2013 11:29:13 -0600
Message-ID: <51E582E9.3030903@wwwdotorg.org>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com> <1372422796-23524-4-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372422796-23524-4-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/28/2013 06:33 AM, Mikko Perttunen wrote:
> USB VBUS regulators are now specified with the vbus-supply property
> instead of nvidia,vbus-gpio, so remove the obsolete properties.
> 
> The equivalent vbus-supply properties were already added in patch
> "ARM: tegra: update device trees for USB binding rework".

(which is in v3.11-rc1, so there aren't any dependencies to worry about)

So, I think the chances of this patch causing any difficult conflicts
are minimal, so it's simplest to just take this series through the USB
tree rather than screwing around with cross-subsystem merge branches.

As such, this one patch,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

And the whole series,
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I would guess that since this series was sent a long time ago almost
during the merge window, it has fallen out of Felipe's and Greg's inbox,
so a resend might be in order. Mikko, if so, please cut/paste the
acked-/reviewed-/tested-by lines above into the commit description to
make life easier for Felipe and/or Greg. Thanks.
