From: Chris Metcalf <cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/5] char: tile-srom: Remove reference to platform_bus
Date: Mon, 1 Sep 2014 09:53:01 -0400
Message-ID: <54047A3D.3090702@tilera.com>
References: <1406298233-27876-1-git-send-email-pawel.moll@arm.com>	 <1406298233-27876-2-git-send-email-pawel.moll@arm.com>	 <53DAA605.2030500@tilera.com> <1406913678.22529.46.camel@hornet>	 <53E139C8.9000502@tilera.com> <1407515691.31897.26.camel@hornet>	 <5400C9C1.4060904@tilera.com> <1409574460.4343.7.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409574460.4343.7.camel@hornet>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 9/1/2014 8:27 AM, Pawel Moll wrote:
> On Fri, 2014-08-29 at 19:43 +0100, Chris Metcalf wrote:
>> If the
>> consensus is that this is the way to go, I can certainly take this change
>> into the Tile tree.
> That would be cool, and left us only with the scsi/DMA as the last user
> of platform_bus. But this is a completely different story ;-)

OK, sounds good.  It's in the tile tree at linux-next now.

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
