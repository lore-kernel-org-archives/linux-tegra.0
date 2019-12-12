From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] ARM: tegra: Fix restoration of PLLM when exiting suspend
Date: Fri, 13 Dec 2019 01:18:11 +0300
Message-ID: <5ac5de2a-e43f-5332-8453-b73f6fdd64b7@gmail.com>
References: <20191210103708.7023-1-jonathanh@nvidia.com>
 <1f2a4f23-5be5-aa7e-6eb4-2aeb4058481d@gmail.com>
 <1fe9cd2d-50a2-aae5-95fa-0329acce4c4c@gmail.com>
 <20191211085016.GW28289@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191211085016.GW28289@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

11.12.2019 11:50, Peter De Schrijver пишет:
> On Tue, Dec 10, 2019 at 11:29:42PM +0300, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 10.12.2019 22:28, Dmitry Osipenko пишет:
>>> Hello Jon,
>>>
>>> PLLM's enable-status could be defined either by PMC or CaR. Thus at
>>> first you need to check whether PMC overrides CaR's enable and then
>>> judge the enable state based on PMC or CaR state respectively.
>>>
>>
>> Actually, now I think that it doesn't make sense to check PMC WB0 state
>> at all. IIUC, PLLM's state of the WB0 register defines whether Boot ROM
>> should enable PLLM on resume from suspend. Thus it will be correct to
>> check only the CaR's enable-state of PLLM.
>>
>> I'm not sure what's the idea of WB0 overriding, maybe to resume faster.
>> Peter, could you please clarify that?
> 
> I don't know why these overriding bits exist. The code for them was in
> the downstream driver so I implemented the same in the upstream driver
> :)

Okay, I'll try to figure out how to clean up it properly.
