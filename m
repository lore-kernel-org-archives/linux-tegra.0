From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tip: core/kprobes] arm/ftrace: Use __patch_text()
Date: Fri, 7 Feb 2020 19:47:28 +0300
Message-ID: <039eac1a-cafe-b20b-77c8-bad019d4320c@gmail.com>
References: <20191113092636.GG4131@hirez.programming.kicks-ass.net>
 <157544841563.21853.2859696202562513480.tip-bot2@tip-bot2>
 <10cbfd9e-2f1f-0a0c-0160-afe6c2ccbebd@gmail.com>
 <20200207112720.GF14914@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200207112720.GF14914-Nxj+rRp3nVydTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tip-bot2 for Peter Zijlstra <tip-bot2-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-tip-commits-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andy Lutomirski <luto-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Brian Gerst <brgerst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, rabin-66gdRtMMWGc@public.gmane.org, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, x86 <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel@li>
List-Id: linux-tegra@vger.kernel.org

07.02.2020 14:27, Peter Zijlstra пишет:
>> NVIDIA Tegra20/30 are not booting with CONFIG_FTRACE=y, but even with
>> CONFIG_FTRACE=n things are not working well.
> 
> Ooh, I think I see. Can you try this:
> 
> diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
> index 2a5ff69c28e6..10499d44964a 100644
> --- a/arch/arm/kernel/ftrace.c
> +++ b/arch/arm/kernel/ftrace.c
> @@ -78,13 +78,10 @@ static int ftrace_modify_code(unsigned long pc, unsigned long old,
>  {
>  	unsigned long replaced;
>  
> -	if (IS_ENABLED(CONFIG_THUMB2_KERNEL)) {
> +	if (IS_ENABLED(CONFIG_THUMB2_KERNEL))
>  		old = __opcode_to_mem_thumb32(old);
> -		new = __opcode_to_mem_thumb32(new);
> -	} else {
> +	else
>  		old = __opcode_to_mem_arm(old);
> -		new = __opcode_to_mem_arm(new);
> -	}
>  
>  	if (validate) {
>  		if (probe_kernel_read(&replaced, (void *)pc, MCOUNT_INSN_SIZE))
> 

Hello Peter,

It fixes the problem, at least kernel is booting fine now and I can't
notice any problems. Thank you very much! :)

Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
