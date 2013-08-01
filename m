From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: DTS: tegra: Add USB entries for Tegra30
Date: Thu, 01 Aug 2013 10:39:10 -0600
Message-ID: <51FA8F2E.8080105@wwwdotorg.org>
References: <1375369218-11288-1-git-send-email-ttynkkynen@nvidia.com> <1375369218-11288-2-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375369218-11288-2-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/01/2013 09:00 AM, Tuomas Tynkkynen wrote:
> Add device tree entries for the 3 USB controllers and PHYs and
> enable the third controller on Cardhu and Beaver boards.
> 
> Fix VBUS regulator entries on Beaver. The GPIO pins were wrong.
> Also, internal pullups need to be enabled on those pins.
> 
> Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: Use internal pullups on the VBUS regulator GPIOs.

Thanks, this version looks good.

Thierry, can you please validate that the gpv group pull strength change
doesn't have any negative affect on your PCIe patches. Thanks.
