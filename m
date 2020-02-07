From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [tip: core/kprobes] arm/ftrace: Use __patch_text()
Date: Fri, 7 Feb 2020 11:26:56 +0100
Message-ID: <20200207102656.GS14946@hirez.programming.kicks-ass.net>
References: <20191113092636.GG4131@hirez.programming.kicks-ass.net>
 <157544841563.21853.2859696202562513480.tip-bot2@tip-bot2>
 <10cbfd9e-2f1f-0a0c-0160-afe6c2ccbebd@gmail.com>
 <20200207101747.GE14914@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20200207101747.GE14914@hirez.programming.kicks-ass.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, x86 <x86@kernel.org>, Denys Vlasenko <dvlasenk@redhat.com>, linux-tip-commits@vger.kernel.org, Brian Gerst <brgerst@gmail.com>, ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org, tip-bot2 for Peter Zijlstra <tip-bot2@linutronix.de>, Jon Hunter <jonathanh@nvidia.com>, rabin@rab.in, Linus Torvalds <torvalds@linux-foundation.org>, Thierry Reding <thierry.reding@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, james.morse@arm.com, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 07, 2020 at 11:17:47AM +0100, Peter Zijlstra wrote:
> Is that crash with FTRACE=y or =n ?
> 
> This really isn't making much sense to me, Will, Mark, any clues?

Does the initial patch:

  https://lkml.kernel.org/r/20191111132458.220458362@infradead.org

work, or does it crash the exact same?
