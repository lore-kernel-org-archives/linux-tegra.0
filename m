From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] usb: phy: tegra: Read UTMIP parameters from device
 tree
Date: Thu, 27 Jun 2013 10:41:35 +0300
Message-ID: <51CBECAF.8050200@nvidia.com>
References: <1372250080-10945-1-git-send-email-mperttunen@nvidia.com> <1372250080-10945-3-git-send-email-mperttunen@nvidia.com> <51CB2A04.9020103@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51CB2A04.9020103-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/2013 08:51 PM, Stephen Warren wrote:
> On 06/26/2013 06:34 AM, Mikko Perttunen wrote:
>> UTMIP parameters used to be hardcoded into tables in the
>> PHY driver. This patch reads them from the device tree instead
>> in accordance with the phy-tegra-usb DT documentation.
>
> This looks fine, although I'd like to have a chance to test all these
> patches before actually ack'ing them.
>

Yeah, I haven't tested these patches on any Tegra20 devices either,
just with my Dalmore. I guess I could scavenge a T20 device from
somewhere..
