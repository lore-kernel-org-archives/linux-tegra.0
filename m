From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 0/3] usb: tegra: Replace nvidia,vbus-gpio property
 with vbus-supply
Date: Mon, 01 Jul 2013 15:08:48 -0600
Message-ID: <51D1EFE0.8070107@wwwdotorg.org>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372422796-23524-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/28/2013 06:33 AM, Mikko Perttunen wrote:
> This patchset removes the ehci-tegra device tree property nvidia,vbus-gpio
> and adds support for the vbus-supply property to phy-tegra-usb.

With bug-fix patch "ARM: tegra: fix VBUS regulator GPIO polarity in DT"
(which I just sent) applied first, this series,

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
