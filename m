From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add bindings for
 nvidia,tegra186-ccplex-cluster
Date: Tue, 13 Jun 2017 15:47:39 +0300
Message-ID: <a7417c4f-d7d4-e11e-a23c-cd0f2fc4adee@kapsi.fi>
References: <1496304245-24024-2-git-send-email-mperttunen@nvidia.com>
 <1497262984-2346-1-git-send-email-mperttunen@nvidia.com>
 <20170613124239.GC16758@ulmo.fritz.box>
 <9ecb973e-ee57-8c89-df21-4ed0bff4bb38@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9ecb973e-ee57-8c89-df21-4ed0bff4bb38-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 13.06.2017 15:46, Mikko Perttunen wrote:
> On 13.06.2017 15:42, Thierry Reding wrote:
>> On Mon, Jun 12, 2017 at 01:23:04PM +0300, Mikko Perttunen wrote:
>>> The Tegra186 CCPLEX_CLUSTER area contains memory-mapped
>>> registers that initiate CPU frequency/voltage transitions.
>>>
>>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> ---
>>>  .../arm/tegra/nvidia,tegra186-ccplex-cluster.txt     | 20
>>> ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-ccplex-cluster.txt
>>>
>>
>> The ARM SoC maintainers don't like to pick up device tree bindings, so
>> I'd prefer this to go through the cpufreq tree that also contains the
>> driver patches. Presumably this wasn't merged through that tree because
>> of the missing Acked-by by a device tree maintainer? Given that Rob's
>> acked it now, maybe you can resend this to Viresh, who I think had
>> picked up the driver?
>
> Sure, I'll do that.

> I guess the .dts change should then also go in that
> way?

Or I guess not, since you applied it :)

Cheers,
Mikko

>
> Mikko
>
>>
>> Thanks,
>> Thierry
>>
