From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 01/11] regulator: core: add API to get voltage
 constraints
Date: Thu, 8 Feb 2018 15:34:56 +0530
Message-ID: <86cd40ac-d255-f4b9-87cb-0cd34efba7d8@nvidia.com>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-2-git-send-email-pdeschrijver@nvidia.com>
 <20180206163544.GI5681@sirena.org.uk>
 <20180207084744.GG7031@tbergstrom-lnx.Nvidia.com>
 <20180207104351.GA6003@sirena.org.uk>
 <20180207123750.GA5850@tbergstrom-lnx.Nvidia.com>
 <20180207141846.GC6003@sirena.org.uk>
 <20180207143213.GB5850@tbergstrom-lnx.Nvidia.com>
 <20180207150155.GD6003@sirena.org.uk>
 <20180207152045.GC5850@tbergstrom-lnx.Nvidia.com>
 <20180207153711.GE6003@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180207153711.GE6003-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On Wednesday 07 February 2018 09:07 PM, Mark Brown wrote:
> On Wed, Feb 07, 2018 at 05:20:45PM +0200, Peter De Schrijver wrote:
>> On Wed, Feb 07, 2018 at 03:01:55PM +0000, Mark Brown wrote:
>>> I can't really tell what you're saying here.  If the driver needs to
>>> know if it can set the a given voltage there's already an API for doing
>>> that as I said.  If you're trying to convey this minimum and maximum
>>> voltage via the constraints that sounds like an abuse of the constraints.
>> No, what I want is the voltage which the regulator will output for a given
>> regulator_set_voltage request taking constraints, regulator step etc into
>> account.
> Knowing the range of the constaints is going to tell you nothing useful
> about that, it has zero information on steps or anything.  The way to
> find out what voltages can be set is to enumerate the voltages that can
> be set through the existing API and then if you want to set a specific
> voltage that you've confirmed is available you can set exactly that
> voltage via the normal voltage setting interface, no need to provide a
> range.

Hi,
I added this API in downstream for the purpose of finding whether rail 
output can be changed or not(fixed) based on constraints.
If min and max is same then it can not change. I used this information 
to set the pad voltage of SOC automatically.

I dont know other usage when I added this API. May be Peter is needed here.
