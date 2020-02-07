From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 0/9] add ASoC components for AHUB
Date: Fri, 7 Feb 2020 21:25:41 +0300
Message-ID: <40a4d544-7c33-3f28-0b9c-384bc9fe3b53@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <fcab0af1-fe84-6028-701b-ab101feaa8de@gmail.com>
 <d17b2654-a888-8251-468d-12ef1451cd4b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d17b2654-a888-8251-468d-12ef1451cd4b@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org, broonie@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com
List-Id: linux-tegra@vger.kernel.org

07.02.2020 14:30, Sameer Pujar пишет:
> 
> 
> On 2/6/2020 11:06 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 30.01.2020 13:33, Sameer Pujar пишет:
>> ...
>>>   sound/soc/tegra/Kconfig                            |  56 ++
>> Probably won't hurt to enable the new drivers in the
>> arch/arm64/configs/defconfig?
> 
> Do you mean, if drivers can be enabled?

Yes, I mean to enable them in the default kernel configuration.
