From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 0/3] usb: tegra: Replace nvidia,vbus-gpio property
 with vbus-supply
Date: Mon, 15 Jul 2013 09:28:50 -0600
Message-ID: <51E41532.5070500@wwwdotorg.org>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com> <51E3E3C5.5060906@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51E3E3C5.5060906-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/15/2013 05:57 AM, Mikko Perttunen wrote:
> Hey Felipe/Stephen,
> 
> what's the status of this patchset and the other one
> ("usb: phy: tegra: Read UTMI parameters from device tree")?
> Can I consider them accepted/pulled for 3.12?

3.11-rc1 was just released over the weekend. Patches for 3.12 can only
just be applied now. I'm planning to look through all the USB cleanup
patches that have been posted recently, test them, and work out the best
way to merge them and handle any dependencies. I'll post mail once I've
done that.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
