From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] arm64: tegra: only map accessible sysram
Date: Sun, 29 Sep 2019 23:28:43 -0600
Message-ID: <5d2e47ec-8304-d648-9c4a-80c7c02050a9@wwwdotorg.org>
References: <20190929200851.14228-1-ykaukab@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190929200851.14228-1-ykaukab@suse.de>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mian Yousaf Kaukab <ykaukab@suse.de>
Cc: linux-tegra@vger.kernel.org, treding@nvidia.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 9/29/19 2:08 PM, Mian Yousaf Kaukab wrote:
> Most of the SysRAM is secure and only accessible by TF-A.
> Don't map this inaccessible memory in kernel. Only map pages
> used by bpmp driver.

I don't believe this change is correct. The actual patch doesn't
implement mapping a subset of the RAM (a software issue), but rather it
changes the DT representation of the SYSRAM hardware. The SYSRAM
hardware always does start at 0x30000000, even if a subset of the
address range is dedicated to a specific purpose. If the kernel must map
only part of the RAM, then some additional property should indicate
this. Also, I believe it's incorrect to hard-code into the kernel's DT
the range of addresses used by the secure monitor/OS, since this can
vary depending on what the user actually chooses to install as the
secure monitor/OS. Any indication of such regions should be filled in at
runtime by some boot firmware or the secure monitor/OS itself, or
retrieved using some runtime API rather than DT.
