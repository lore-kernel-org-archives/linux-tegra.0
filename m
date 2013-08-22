From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: always enable USB VBUS regulators
Date: Wed, 21 Aug 2013 21:35:12 -0700
Message-ID: <20130822043512.GA4237@quad.lixom.net>
References: <1377028813-32762-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377028813-32762-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle McMartin <kmcmarti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 20, 2013 at 02:00:13PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This fixes a regression exposed during the merge window by commit
> 9f310de "ARM: tegra: fix VBUS regulator GPIO polarity in DT"; namely that
> USB VBUS doesn't get turned on, so USB devices are not detected. This
> affects the internal USB port on TrimSlice (i.e. the USB->SATA bridge, to
> which the SSD is connected) and the external port(s) on Seaboard/
> Springbank and Whistler.
> 
> The Tegra DT as written in v3.11 allows two paths to enable USB VBUS:
> 
> 1) Via the legacy DT binding for the USB controller; it can directly
>    acquire a VBUS GPIO and activate it.
> 
> 2) Via a regulator for VBUS, which is referenced by the new DT binding
>    for the USB controller.
> 
> Those two methods both use the same GPIO, and hence whichever of the
> USB controller and regulator gets probed first ends up owning the GPIO.
> In practice, the USB driver only supports path (1) above, since the
> patches to support the new USB binding are not present until v3.12:-(
> 
> In practice, the regulator ends up being probed first and owning the
> GPIO. Since nothing enables the regulator (the USB driver code is not
> yet present), the regulator ends up being turned off. This originally
> caused no problem, because the polarity in the regulator definition was
> incorrect, so attempting to turn off the regulator actually turned it
> on, and everything worked:-(
> 
> However, when testing the new USB driver code in v3.12, I noticed the
> incorrect polarity and fixed it in commit 9f310de "ARM: tegra: fix VBUS
> regulator GPIO polarity in DT". In the context of v3.11, this patch then
> caused the USB VBUS to actually turn off, which broke USB ports with VBUS
> control. I got this patch included in v3.11-rc1 since it fixed a bug in
> device tree (incorrect polarity specification), and hence was suitable to
> be included early in the rc series. I evidently did not test the patch at
> all, or correctly, in the context of v3.11, and hence did not notice the
> issue that I have explained above:-(
> 
> Fix this by making the USB VBUS regulators always enabled. This way, if
> the regulator owns the GPIO, it will always be turned on, even if there
> is no USB driver code to request the regulator be turned on. Even
> ignoring this bug, this is a reasonable way to configure the HW anyway.
> 
> If this patch is applied to v3.11, it will cause a couple pretty trivial
> conflicts in tegra20-{trimslice,seaboard}.dts when creating v3.12, since
> the context right above the added lines changed in patches destined for
> v3.12.
> 
> Reported-by: Kyle McMartin <kmcmarti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This is a patch for v3.11-rc*

Applied, thanks.

-Olof
