From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add bindings for
 nvidia,tegra186-ccplex-cluster
Date: Tue, 13 Jun 2017 15:46:46 +0300
Message-ID: <9ecb973e-ee57-8c89-df21-4ed0bff4bb38@kapsi.fi>
References: <1496304245-24024-2-git-send-email-mperttunen@nvidia.com>
 <1497262984-2346-1-git-send-email-mperttunen@nvidia.com>
 <20170613124239.GC16758@ulmo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170613124239.GC16758@ulmo.fritz.box>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 13.06.2017 15:42, Thierry Reding wrote:
> On Mon, Jun 12, 2017 at 01:23:04PM +0300, Mikko Perttunen wrote:
>> The Tegra186 CCPLEX_CLUSTER area contains memory-mapped
>> registers that initiate CPU frequency/voltage transitions.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../arm/tegra/nvidia,tegra186-ccplex-cluster.txt     | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-ccplex-cluster.txt
>
> The ARM SoC maintainers don't like to pick up device tree bindings, so
> I'd prefer this to go through the cpufreq tree that also contains the
> driver patches. Presumably this wasn't merged through that tree because
> of the missing Acked-by by a device tree maintainer? Given that Rob's
> acked it now, maybe you can resend this to Viresh, who I think had
> picked up the driver?

Sure, I'll do that. I guess the .dts change should then also go in that way?

Mikko

>
> Thanks,
> Thierry
>
