From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v11 7/7] ARM: tegra: support Trusted Foundations by default
Date: Tue, 26 Nov 2013 10:35:58 +0900
Message-ID: <CAAVeFu+mMyPhFtVZ09vgYWWCYkPpF3X547ffRAfXXKOOWUUkqg@mail.gmail.com>
References: <1385274652-16415-1-git-send-email-acourbot@nvidia.com>
 <1385274652-16415-8-git-send-email-acourbot@nvidia.com> <20131126000608.GA21634@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131126000608.GA21634@quad.lixom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Dave Martin <Dave.Martin@arm.com>, Kevin Hilman <khilman@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 26, 2013 at 9:06 AM, Olof Johansson <olof@lixom.net> wrote:
> On Sun, Nov 24, 2013 at 03:30:52PM +0900, Alexandre Courbot wrote:
>> Support for Trusted Foundations is light and allows the kernel to run on
>> a wider range of devices, so enable it by default.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>> Reviewed-by: Stephen Warren <swarren@nvidia.com>
>> ---
>>  arch/arm/configs/tegra_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>
> I think we want this enabled on multi_v7_defconfig too? Send a separate
> patch for that once this is merged though.

Will do.

Thanks,
Alex.
