From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add bindings for
 nvidia,tegra186-ccplex-cluster
Date: Thu, 8 Jun 2017 10:32:01 +0300
Message-ID: <782ec765-f949-3023-93e3-a731f8bb524a@kapsi.fi>
References: <1496304245-24024-1-git-send-email-mperttunen@nvidia.com>
 <1496304245-24024-2-git-send-email-mperttunen@nvidia.com>
 <20170607221102.2bctvsdciv7y26lk@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170607221102.2bctvsdciv7y26lk@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08.06.2017 01:11, Rob Herring wrote:
> On Thu, Jun 01, 2017 at 11:04:04AM +0300, Mikko Perttunen wrote:
>> The Tegra186 CCPLEX_CLUSTER area contains memory-mapped
>> registers that initiate CPU frequency/voltage transitions.
>
> What the block is should also go in the binding doc. With that,

I don't know how to explain it in more detail; this thing is literally 
just a few magic registers that route into some CPU control logic to 
trigger frequency/voltage transitions :)

Mikko

>
> Acked-by: Rob Herring <robh@kernel.org>
>
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>  .../arm/tegra/nvidia,tegra186-ccplex-cluster.txt        | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-ccplex-cluster.txt
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
