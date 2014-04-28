From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 00/16] Another 16 L2C patches
Date: Mon, 28 Apr 2014 12:08:11 -0600
Message-ID: <535E990B.2020405@wwwdotorg.org>
References: <20140428165631.GM26756@n2100.arm.linux.org.uk>
 <535E8BEE.1000100@wwwdotorg.org> <535E8F6D.9000803@wwwdotorg.org>
 <20140428173943.GN26756@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140428173943.GN26756@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

(Dropping most people from CC since this sub-thread is a Tegra-specific
discussion)

On 04/28/2014 11:39 AM, Russell King - ARM Linux wrote:
> On Mon, Apr 28, 2014 at 11:27:09AM -0600, Stephen Warren wrote:
...
>> I do see one error in dmesg during boot, but it doesn't appear to
>> negatively affect operation in brief testing, and is present in
>> linux-next without this series anyway. Is this message a problem?
>>
>>> [    0.000000] L2C: platform modifies aux control register: 0x02080000 -> 0x3e480001
>>> [    0.000000] L2C: DT/platform modifies aux control register: 0x02080000 -> 0x3e480001
>>> [    0.000000] L2C-310 errata 727915 769419 enabled
>>> [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
>>> [    0.000000] L2C-310: enabling full line of zeros but not enabled in Cortex-A9
>>                           ^^^^^^ this is logged at error level
> 
> Correct, it's an error because on Tegra you explicitly set bit 0 in the
> auxiliary control register, which is pointless unless the feature is
> also enabled in the Cortex-A9 control register as well.

Please forgive my almost complete lack of knowledge re: cache
controllers. Is the correct fix for this:

a) To remove bit 0 from the aux_val passed to l2x0_of_init()

b) To set some BIT(3) in the Cortex-A9 auxcr, so this feature is enabled
there too.

And if (b), I assume that's something that the bootloader should be
doing, not the kernel?

Thanks.
