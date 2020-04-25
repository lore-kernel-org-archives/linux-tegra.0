From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5.4.33 0/2] Fix for long operation cmds busy detection
Date: Fri, 24 Apr 2020 19:42:16 -0700
Message-ID: <81be9ca0-5c61-6e94-8398-85354764b429@nvidia.com>
References: <1587758766-3274-1-git-send-email-skomatineni@nvidia.com>
 <20200425014556.GD13035@sasha-vm>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200425014556.GD13035@sasha-vm>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, bradleybolen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, anrao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/24/20 6:45 PM, Sasha Levin wrote:
> External email: Use caution opening links or attachments
>
>
> On Fri, Apr 24, 2020 at 01:06:04PM -0700, Sowjanya Komatineni wrote:
>> This series is to backport the upstream patches that fixes busy=20
>> detection
>> for long operation mmc commands by implementing Tegra specific timeout
>> callback to switch between finite and infinite HW busy detection wait
>> modes.
>>
>>
>> Sowjanya Komatineni (2):
>> =C2=A0sdhci: tegra: Implement Tegra specific set_timeout callback
>> =C2=A0sdhci: tegra: Enable MMC_CAP_WAIT_WHILE_BUSY host capability
>
> What regression do these patches fix?
>
This isn't a regression as we don't have any known failures as of today=20
with the specific mmc devices we are using on our platforms.

But this patch fixes a long outstanding bug for sdhci-tegra to handle=20
long busy wait for mmc command operations that may take longer than host=20
max busy timeout. So, this is something that's missing from the=20
beginning and good to have.


> --=20
> Thanks,
> Sasha
