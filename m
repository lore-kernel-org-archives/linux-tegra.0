From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: tegra20: Rename USB UTMI parameters
 according to new definitions
Date: Tue, 16 Jul 2013 11:27:07 -0600
Message-ID: <51E5826B.9040607@wwwdotorg.org>
References: <1372250080-10945-1-git-send-email-mperttunen@nvidia.com> <1372250080-10945-2-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372250080-10945-2-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/26/2013 06:34 AM, Mikko Perttunen wrote:
> This patch changes the Tegra20 USB PHY nodes to use the UTMI configuration
> parameter names as specified in the device tree binding documentation
> after patch "ARM: tegra: finalize USB EHCI and PHY bindings".

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
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
