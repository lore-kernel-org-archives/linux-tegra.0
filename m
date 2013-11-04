From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Mon, 4 Nov 2013 13:59:33 +0800
Message-ID: <527737C5.5080901@nvidia.com>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
 <20131031162029.GF2493@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131031162029.GF2493-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/01/2013 12:20 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Thu, Oct 31, 2013 at 03:05:26PM +0800, Wei Ni wrote:
>> Set full constraints during machine initialisation, so that the
>> regulator_get() can get the dummy regulator if the regulator is
>> physically present and enabled.
>> Discussed this in the link:
>> https://lkml.org/lkml/2013/10/8/40
> 
> This should be done for all DT systems - I'd expect this to be done in
> generic DT init code rather than for a specific board.

Hi, Mark
I didn't find the generic DT init code, do you mean to add it in the
customize_machine() in arch/arm/kernel/setup.c ? But it isn't only for
DT systems.
How about to add it in the regulator subsystem? I mean we can add
following codes in the regulator_init() routine in driver/regulator/core.c:
+#ifdef CONFIG_OF
+regulator_has_full_constraints();
+#endif

Thanks.
Wei.

> 
> * Unknown Key
> * 0x7EA229BD
> 
