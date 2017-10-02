From: Timo Alho <talho@nvidia.com>
Subject: Re: [PATCH] firmware: tegra: add BPMP debugfs support
Date: Mon, 2 Oct 2017 11:36:23 +0300
Message-ID: <e1e20e48-11a1-9b57-01a8-8eacef878571@nvidia.com>
References: <1503410640-2691-1-git-send-email-talho@nvidia.com>
 <31191fe9-41d6-5527-2a31-389d113c459e@nvidia.com>
 <7d3aaba8-13ef-7713-d0a9-726ed5fbde0e@nvidia.com>
 <2a51649c-99d3-4e72-9a81-e93aec8f72de@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2a51649c-99d3-4e72-9a81-e93aec8f72de@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Hunter <jonathanh@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org



On 29.09.2017 17:58, Jonathan Hunter wrote:
>>>> +static int bpmp_populate_dir(struct tegra_bpmp *bpmp, struct seqbuf
>>>> *seqbuf,
>>>> +                 struct dentry *parent, uint32_t depth)
>>>
>>> Do we need to use uint32_t here?
>>>
>>>> +{
>>>> +    int err;
>>>> +    uint32_t d, t;
>>>
>>> And here?
>>
>> It's part of the BPMP ABI that the data passed is 32 bit unsigned
>> integer. I wanted to emphasise that with the choice of integer type. Or
>> did you mean why I did not use u32?
> 
> Yes why not just u32?
> 

No other reason than just a personal bias to use standard C99 integer 
types. The downstream driver was using a mix of both so wanted to 
standardize to just one.
