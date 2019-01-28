From: Billy Laws <blaws05@gmail.com>
Subject: Re: [2/2] mfd: max77620: Add low battery monitor support
Date: Mon, 28 Jan 2019 07:33:37 +0000
Message-ID: <CAFUUQHMFm=t_7CfVkieqZqwGAN0U39tHUHTVx6PwbgefkAaeQA@mail.gmail.com>
References: <3587c682-e1db-5140-fd8e-13c46d882dd3@gmail.com> <20190128071654.GC4678@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128071654.GC4678@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 1/28/19, Lee Jones <lee.jones@linaro.org> wrote:
> Re-sending due to dodgy looking 'reply-to'.
>
> On Sun, 27 Jan 2019, Billy Laws wrote:
>
>> >This patch adds PMIC configurations for low-battery
>> >monitoring by handling max77620 register CNFGGLBL1.
>> >
>> It might be an idea to add lbhyst configuration here and support using
>> custom lbdac values to specify a different cutoff point.
>
> Do you know why this email was sent independent of the original
> submission?  Something wrong with your mailer?
>
I tried to add the reply to manually in thunderbird as I wasn't
subscribed to the mailing list, seems it didn't exactly work.
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
>
