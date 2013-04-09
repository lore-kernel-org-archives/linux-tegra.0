From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [GIT PULL 7/8] ARM: tegra: multi-platform conversion
Date: Tue, 09 Apr 2013 15:49:03 -0600
Message-ID: <51648CCF.80902@wwwdotorg.org>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org>
 <1365181426-11547-7-git-send-email-swarren@wwwdotorg.org>
 <201304091659.08376.arnd@arndb.de> <201304092201.18950.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201304092201.18950.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-tegra@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 04/09/2013 02:01 PM, Arnd Bergmann wrote:
> On Tuesday 09 April 2013, Arnd Bergmann wrote:
>> On Friday 05 April 2013, Stephen Warren wrote:
>>> This branch converts Tegra to support multi-platform/single-zImage.
> 
>> I had to reorder the branches in arm-soc to avoid starting a
>> next/multiplatform2 branch, but I saw nothing that prevents us from
>> having multiplatform after soc.
> 
> I've applied this patch on top.
...
> Subject: [PATCH] ARM: tegra: build assembly files with -march=armv7-a
> 
> The tegra assembly files are written for ARMv7 and are not compatible
> with ARMv6, which leads to build warnings when compiling a dual
> ARMv6/v7 kernel. Since this code is only ever run on Tegra ARMv7
> hardware, we can tell the assembler which architecture level to
> use.

Ah yes, I hit that problem too, but wasn't sure how to solve it. The
patch below looks good. Now I must go try a combo bcm2835+Tegra kernel
on both devices...
