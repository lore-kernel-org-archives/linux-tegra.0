From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: harmony: initialize the TPS65862 PMIC
Date: Wed, 09 Mar 2011 15:23:11 +0200
Message-ID: <4D777F3F.40208@compulab.co.il>
References: <cover.1299588456.git.mike@compulab.co.il> <4ade6d195fff78271085eafb0a99de3be8beb426.1299588456.git.mike@compulab.co.il> <20110308131541.GB5892@sirena.org.uk> <4D772F23.70304@compulab.co.il> <20110309101508.GD6923@opensource.wolfsonmicro.com> <4D776A42.9030107@compulab.co.il> <20110309122222.GG6923@opensource.wolfsonmicro.com> <4D777E6C.5040000@compulab.co.il> <20110309131511.GB30257@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110309131511.GB30257-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/09/11 15:15, Mark Brown wrote:
> On Wed, Mar 09, 2011 at 03:19:40PM +0200, Mike Rapoport wrote:
>> On 03/09/11 14:22, Mark Brown wrote:
> 
>>> Note that there's no issue with having no supplies set for a regulator
>>> so no reason not to register the supplies themselves, it's just the
>>> supply map that I was flagging.
> 
>> I.e. having something like
> 
>> static struct regulator_consumer_supply tps658621_ldo7_supply[] = {
>> };
> 
> Well, I'd just omit the array entirely if it's empty but yes.

This would break nice un-namespaced REGULATOR_INIT macros :)

> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Sincerely yours,
Mike.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
