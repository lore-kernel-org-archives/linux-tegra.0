From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: palmas: add input supply names
Date: Wed, 20 Mar 2013 19:02:30 +0530
Message-ID: <5149BA6E.7070003@nvidia.com>
References: <1363598989-25112-1-git-send-email-ldewangan@nvidia.com> <20130320123128.GM28775@opensource.wolfsonmicro.com> <5149B19E.90400@nvidia.com> <20130320132531.GO28775@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130320132531.GO28775-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 20 March 2013 06:55 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Mar 20, 2013 at 06:24:54PM +0530, Laxman Dewangan wrote:
>
>> The regulator core register the regulator even if there is NULL
>> init_data and in this case, it tries to findout the input-supply
>> (provided through desc->supply_name) and it fails to find out the
>> supply handle and so regulator register fails cause all regulator
>> registration to fail.
>> So providing the dec->supply_name only in case of valid init_data.
> This works fine if you have a device per regulator instead of a device
> for all the regulators on the chip...  I would be inclined to address
> this by providing a "floating" supply and connecting everythinng to
> that.
I am fine with adding floating supply similar to below and connect all 
non-connected supply pins to this.

                 floating: regulator@1 {
                         compatible = "regulator-fixed";
                         reg = <1>;
                         regulator-name = "floating";
                 };

If this is fine then I will respin the patch to remove condition.
