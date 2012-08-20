From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: tegra: harmony: add regulators
Date: Mon, 20 Aug 2012 12:08:45 -0600
Message-ID: <50327D2D.6000509@wwwdotorg.org>
References: <1345186799-18229-1-git-send-email-ldewangan@nvidia.com> <502E9B09.3080800@wwwdotorg.org> <502EA1AC.4090205@wwwdotorg.org> <50327242.80103@nvidia.com> <50327897.5030601@wwwdotorg.org> <20120820175410.GI26991@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120820175410.GI26991-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/20/2012 11:54 AM, Mark Brown wrote:
> On Mon, Aug 20, 2012 at 11:49:11AM -0600, Stephen Warren wrote:
> 
>> The problem there is that will prevent any regulators from being 
>> registered at all, until the patch is merged with the regulator
>> tree. That will also prevent PCIe working on Harmony. Those both
>> work right now, so that's a bisection breakage.
> 
>> I suppose the solution here is to merge the regulator tree into
>> the Tegra branch before the Harmony regulator patch. Mark, can we
>> do that?
> 
> I've no idea what you're talking about here, sorry.  What are
> "this" and "the patch"?  Surely you can just add whatever DT
> changes you need to add without the thing that uses the bindings?

When booting Harmony using device tree, there's a special case that
registers all the regulators using the remnants of the Harmony board
file. Hence, regulators work right now even without the DT
instantiating them.

The patch in this thread adds all the required regulators to the DT
file. However, it should also remove the special case so the
regulators don't get registered twice, once from the board file and
once from DT. However, doing that would prevent regulators getting
registered at all, since v3.6-rc* don't have all the required
(TPS6586x) regulator (driver) patches to get the regulators
instantiated from DT. Everything will only work in linux-next or
sometime during the 3.7 merge window.  Hence, git bisect would be broken.

One solution to this is to bring the regulator tree into the Tegra
tree as a dependency, and then apply a patch which adds the regulators
to DT, and removes the special case from the board file. I'm asking
for your OK to do that.
