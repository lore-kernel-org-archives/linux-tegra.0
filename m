From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: tegra20: add labels to i2c nodes
Date: Mon, 23 Dec 2019 18:44:52 +0300
Message-ID: <1a93a7a6-c3a1-0b94-ce3e-de8971487de5@gmail.com>
References: <20191219130431.30458-1-richard.leitner@skidata.com>
 <01ac756c-1e51-5d62-ca45-9e0b4f106a29@gmail.com>
 <27d4c933-8117-f38e-d4da-e58326fc6ee4@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <27d4c933-8117-f38e-d4da-e58326fc6ee4@skidata.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

23.12.2019 10:46, Richard Leitner пишет:
> Hi,
> thanks for the reply.
> 
> On 20/12/2019 15:00, Dmitry Osipenko wrote:
>> 19.12.2019 16:04, Richard Leitner пишет:
>>> Add numbered labels to the i2c nodes of the Tegra20 SoC so we just need
>>> to alias it from derived boards.
>>>
>>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>>> ---
>>>   arch/arm/boot/dts/tegra20.dtsi | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> ...
> 
>>
>> Hello Richard,
>>
>> Why derived boards couldn't label nodes by themselves? That's what all
>> derived boards are doing already.
> 
> Of course they can, but IMHO its more useful to have the same labels for
> all derived boards.
> 
>>
>> BTW, upstream should benefit from the submitted changes. This is not a
>> very useful change for upstream if you're not updating the actual DTs of
>> any of the boards in arch/arm/boot/dts/*.
> 
> That's true. I thought of also patching the actual DTs but wasn't sure
> if that should be in the same series...
> Based on your answer I guess it should be.
> 
> Therefore I'll send a v2 soon.
> 
> Thanks again & regards;richard.l

Seeing the full picture will be very helpful, thanks.
