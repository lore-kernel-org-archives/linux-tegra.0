From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [GIT PULL 1/3] ARM: tegra: rework PCIe regulators
Date: Thu, 17 Jul 2014 20:47:07 -0600
Message-ID: <53C88AAB.9010809@wwwdotorg.org>
References: <1403558626-13422-1-git-send-email-swarren@wwwdotorg.org> <20140707003854.GD8469@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140707003854.GD8469-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/06/2014 06:38 PM, Olof Johansson wrote:
> On Mon, Jun 23, 2014 at 03:23:44PM -0600, Stephen Warren wrote:
>> This branch reworks the set of regulators that the Tegra PCIe driver
>> uses, so that the driver and DT bindings more correctly model what's
>> really going on in HW.
>>
>> I've made this a separate branch in case it needs to be pulled into the
>> PCIe tree to resolve any conflicts. Any branch that adds Tegra124
>> support to the PCIe driver will need to be based on this branch, and
>> such patches might show up for 3.17, and be taken through the ARM tree
>> so we can manage our own dependencies.
> 
> Isn't PCI broken if you boot with an older device tree now?
> 
> I would like to see this as two branches: One to the PCI driver, and one
> modifying DT contents. The PCI driver should remain working for old DTs,
> so the last couple of commits on this branch can't be there.

I thought it was still completely legal to change DT bindings that were
not yet considered stable. None of the Tegra bindings have yet been
deemed stable.
