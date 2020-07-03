From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 28/37] memory: tegra: Register as interconnect provider
Date: Fri, 3 Jul 2020 11:41:14 +0300
Message-ID: <31565962-a25c-324f-8319-b3e3ea66b4f1@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
 <20200609131404.17523-29-digetx@gmail.com>
 <aec831a6-a7ad-6bcc-4e15-c44582f7568e@linaro.org>
 <82d27a47-f189-6609-a584-c9ca1b35a76c@gmail.com>
 <05cb459d-fc10-1537-eaea-df06f7566b6a@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <05cb459d-fc10-1537-eaea-df06f7566b6a@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

02.07.2020 15:36, Georgi Djakov пишет:
...
>>>> +	mc->provider.data = data;
>>>> +	mc->provider.xlate = of_icc_xlate_onecell;
>>>> +	mc->provider.aggregate = tegra_mc_icc_aggregate;
>>>> +
>>>> +	err = icc_provider_add(&mc->provider);
>>>> +	if (err)
>>>> +		goto err_msg;
>>>
>>> Nit: I am planning to re-organize some of the existing drivers to call
>>> icc_provider_add() after the topology is populated. Could you please move
>>> this after the nodes are created and linked.
>>
>> Are you planning to remove the provider's list-head initialization from
>> the icc_provider_add() [1] and move it to the individual provider
>> drivers, correct?
> 
> Yes, that would be the first step, but i need to post some patches first,
> so let's keep it as-is for now. Sorry for the confusion.

No problems, I'll keep an eye on the ICC core changes!
Please feel free to the CC me on the patches, I may give them a whirl.
