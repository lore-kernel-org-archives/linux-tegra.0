From: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] memory: tegra: Fix -Wunused-const-variable
Date: Thu, 13 Jun 2019 10:57:04 -0700
Message-ID: <CAKwvOdn930hhHcnCA9arJ5=9SsT-6BfFC_1punmUZX2xWM-Hnw@mail.gmail.com>
References: <20190613172746.216819-1-nhuck@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613172746.216819-1-nhuck@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Huckleberry <nhuck@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 13, 2019 at 10:28 AM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
> The only usage of this variable is from within an ifdef.
> It seems logical to move the variable into the ifdef as well.

Thanks for the patch, I agree but have the same thoughts as in:
https://lkml.org/lkml/2019/6/13/1438

> +#ifdef CONFIG_ARCH_TEGRA_124_SOC
>  static const unsigned long tegra124_mc_emem_regs[] = {
>         MC_EMEM_ARB_CFG,
>         MC_EMEM_ARB_OUTSTANDING_REQ,
> @@ -54,6 +55,7 @@ static const unsigned long tegra124_mc_emem_regs[] = {
>         MC_EMEM_ARB_MISC1,
>         MC_EMEM_ARB_RING1_THROTTLE
>  };
> +#endif
-- 
Thanks,
~Nick Desaulniers
