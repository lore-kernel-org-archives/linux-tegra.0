From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3] ARM: tegra: enforce PM requirement
Date: Wed, 20 Mar 2019 09:48:06 +0530
Message-ID: <226b42a9-766f-2124-6af9-891694ad1195@nvidia.com>
References: <1551255628-4794-1-git-send-email-spujar@nvidia.com>
 <6e5bf310-12b5-26a3-f466-95cc56c6932a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6e5bf310-12b5-26a3-f466-95cc56c6932a@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, linux@armlinux.org.uk, jhogan@kernel.org, jonathanh@nvidia.com, treding@nvidia.com
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 2/27/2019 7:01 PM, Dmitry Osipenko wrote:
> 27.02.2019 11:20, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Currently runtime PM is enabled for Tegra HDA driver. One of the concern
>> raised was about handling !PM case in HDA driver. In this case, there is
>> a need to manage clocks and power explicitly in the driver and reviewers
>> were not really convinced about this. The consensus at the end was to
>> enforce PM requirement to keep things simple, rather driver mentioning a
>> dependency on PM. This is how it is done for ARM 64-bit Tegra platforms
>> and the same can be done for 32-bit Tegra platforms too.
>>
>> Finally the objective is to remove dependency on PM availability for all
>> Tegra drivers. The detailed discussion can be found in following patch,
>> https://patchwork.ozlabs.org/patch/1031007/
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Reviewed-by: Thierry Reding <treding@nvidia.com>
>> Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
>> ---
> The commit message is okay to me this time, thanks! I'm still not super-h=
appy to lose the !PM option because of its value in regards to the PM debug=
ging, but again we can just do something better in that regards later on if=
 will be really needed.
>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Do we have any further concerns over the patch? Request maintainers for=20
merge otherwise.
