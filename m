From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: palmas: add input supply names
Date: Wed, 20 Mar 2013 18:24:54 +0530
Message-ID: <5149B19E.90400@nvidia.com>
References: <1363598989-25112-1-git-send-email-ldewangan@nvidia.com> <20130320123128.GM28775@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130320123128.GM28775-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 20 March 2013 06:01 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Mon, Mar 18, 2013 at 02:59:48PM +0530, Laxman Dewangan wrote:
>
> There's something odd about several recent patch serieses you've posted,
> they end up with patch 2 before instead of after patch 1.  Anyway...

I generally send a patches on single git-send command
git send-emal --to=ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org 0000.patch 0001.patch

So file names are in seq but not sure why it is not on seq. Something 
mail exchange  resuffle.
Probably I need to send one by one...


>
>> +		if (config.init_data)
>> +			pmic->desc[id].supply_name = palmas_regs_info[id].sname;
>> +
> This looks wrong...  why is it conditional on init_data?

Some of the rails are not used in board and hence their inputs are also 
left floating (unconnected). In this case, during DT population, I did 
not put entry
i.e. if ldo1 is not used then ldo1-in is not connected on board and hence
entry on DT

ldo1-in-supply=<&xyzreg>;

is not there.

The regulator core register the regulator even if there is NULL 
init_data and in this case, it tries to findout the input-supply 
(provided through desc->supply_name) and it fails to find out the supply 
handle and so regulator register fails cause all regulator registration 
to fail.

So providing the dec->supply_name only in case of valid init_data.
