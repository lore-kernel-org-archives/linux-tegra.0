From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v5 07/19] dt-bindings: soc: tegra-pmc: Add id for Tegra
 PMC 32KHz blink clock
Date: Fri, 27 Dec 2019 13:35:34 -0800
Message-ID: <fe48ca0e-c26e-5163-fb66-1eefe5f45bcc@nvidia.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-8-git-send-email-skomatineni@nvidia.com>
 <20191226181715.GA12506@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191226181715.GA12506@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/26/19 10:17 AM, Rob Herring wrote:
> On Fri, 20 Dec 2019 14:26:53 -0800, Sowjanya Komatineni wrote:
>> Tegra PMC has blink functionality that allows 32KHz clock out to
>> blink pin of the Tegra.
>>
>> This patch adds id for this blink clock to use for enabling or
>> disabling blink output through device tree.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   include/dt-bindings/soc/tegra-pmc.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

Sorry Rob, missed to add Acked-by tag for this patch in this series.

Will make sure of having all received Acked-by/Reviewed-by tags from 
next time.
