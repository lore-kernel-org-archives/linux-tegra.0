From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 6 Nov 2013 18:39:03 +0800
Message-ID: <527A1C47.6050405@nvidia.com>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
 <20131031162029.GF2493@sirena.org.uk> <527737C5.5080901@nvidia.com>
 <20131104161828.GK2493@sirena.org.uk> <5278B4CB.9050305@nvidia.com>
 <20131106085100.GB11602@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131106085100.GB11602-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/06/2013 04:51 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Nov 05, 2013 at 05:05:15PM +0800, Wei Ni wrote:
>> On 11/05/2013 12:18 AM, Mark Brown wrote:
> 
>>> We can do it as part of parsing the DT or deciding to parse the DT.
> 
>> I checked the kernel codes, it seems the different arch uses different
>> way to parse DT, and I think these codes are related with DT, it's not
>> better to add such regulator full constraints codes.
> 
> There's a lot of shared code there, and it's most likely that any new
> platforms will be using the flattened device tree code.  Anything other
> than doing this when we start device tree is going to leave a window
> where we will be using device tree but not handling that in the
> regulator API.

I still can't find a good place to set full_constraints, could you
please show me some reference codes where we can set it?

BTW, add Cc to devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Thanks.
Wei.

> 
> * Unknown Key
> * 0x7EA229BD
> 
