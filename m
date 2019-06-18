From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 7/8] soc/tegra: regulators: Add regulators coupler for
 Tegra20
Date: Tue, 18 Jun 2019 20:19:05 +0300
Message-ID: <bb84db4c-4d11-3199-ce96-3cd7c70ba911@gmail.com>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-8-digetx@gmail.com>
 <20190617154632.GB5316@sirena.org.uk>
 <2308e5da-a8fd-a0e6-f98c-0931a30baf14@gmail.com>
 <20190618171453.GO5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618171453.GO5316@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.06.2019 20:14, Mark Brown пишет:
> On Tue, Jun 18, 2019 at 07:52:06PM +0300, Dmitry Osipenko wrote:
>> 17.06.2019 18:46, Mark Brown пишет:
> 
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * Voltage regulators coupling resolver for NVIDIA Tegra20
>>>> + *
>>>> + * Copyright (C) 2019 GRATE-DRIVER project
> 
>>> Please make the entire comment a C++ one so things look more
>>> intentional.
> 
>> This is actually a correct SPDX comment style for the source files, accordingly to
>> checkpatch. While the C++ style should be used for header files only. I'm not
>> following the SPDX effort much, don't know from where these SPDX-style rules are
>> coming from.
> 
> The SPDX bit is fine, what I'm saying is make the rest of the comment
> also be a C++ comment.
> 

Ah, I just realized that the "// " is the C++ comment style and not C. I can turn it
all into the C++, no problems.
