From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for
 Tegra210
Date: Wed, 5 Feb 2020 11:54:26 -0800
Message-ID: <7e0ec06e-bb40-acf7-fd47-ced4b401afb2@nvidia.com>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <20200205192620.3A1F620720@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20200205192620.3A1F620720@mail.kernel.org>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, frankc@nvidia.com, hverkuil@xs4all.nl, jonathanh@nvidia.com, thierry.reding@gmail.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 2/5/20 11:26 AM, Stephen Boyd wrote:
> External email: Use caution opening links or attachments
>
>
> Quoting Sowjanya Komatineni (2020-01-28 10:23:20)
>> diff --git a/drivers/staging/media/tegra/Kconfig b/drivers/staging/media/tegra/Kconfig
>> new file mode 100644
>> index 000000000000..443b99f2e2c9
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +config VIDEO_TEGRA
>> +       tristate "NVIDIA Tegra VI driver"
>> +       depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>> +       depends on COMMON_CLK
> What depends on the common clk framework? I don't see any clk-provider.h
> includes here.
COMMON_CLK is not needed. Will remove in v2. Thanks.
>
>> +       depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
>> +       depends on MEDIA_CONTROLLER
>> +       select TEGRA_HOST1X
>> +       select VIDEOBUF2_DMA_CONTIG
>> +       select V4L2_FWNODE
>> +       help
>> +         Say yes here to enable support for Tegra video input hardware
