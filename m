From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3] regmap: add iopoll-like atomic polling macro
Date: Thu, 9 Jan 2020 12:54:31 +0530
Message-ID: <b9f5459f-007e-3139-a3cf-c7dfd3fc335a@nvidia.com>
References: <1578546590-24737-1-git-send-email-spujar@nvidia.com>
 <fa5198bf-0001-3a57-017f-1b40e0188606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fa5198bf-0001-3a57-017f-1b40e0188606@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, broonie@kernel.org
Cc: jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 1/9/2020 11:30 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 09.01.2020 08:09, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds a macro 'regmap_read_poll_timeout_atomic' that works
>> similar to 'readx_poll_timeout_atomic' defined in linux/iopoll.h; This
>> is atomic version of already available 'regmap_read_poll_timeout' macro.
>>
>> It should be noted that above atomic macro cannot be used by all regmaps=
.
>> If the regmap is set up for atomic use (flat or no cache and MMIO) then
>> only it can use.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
> Could you please explain what is the targeted use-case here?

I was trying to use regmap_read_poll_timeout() to poll for status change=20
of a register. This resulted in "BUG: scheduling while atomic". The=20
callback function, in which I was trying to use the macro, runs in=20
atomic context. Hence new atomic macro is added. I was checking ALSA=20
playback/capture and trigger() callback had to monitor some register status=
.

In general, the new macro can be used in atomic callbacks where regmap=20
interface is used and polling is required.
