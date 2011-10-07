From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Subject: Re: [PATCH] ARM: tegra: fix compilation error due to mach/hardware.h
	removal
Date: Fri, 07 Oct 2011 15:39:35 +0400
Message-ID: <4E8EE4F7.9040503@ru.mvista.com>
References: <1317954199-25284-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1317954199-25284-1-git-send-email-olof@lixom.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-tegra@vger.kernel.org, torvalds@linux-foundation.com, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, Marc Dietrich <marvin24@gmx.de>
List-Id: linux-tegra@vger.kernel.org

Hello.

On 07-10-2011 6:23, Olof Johansson wrote:

> From: Marc Dietrich <marvin24@gmx.de>

> This fixes a compilation error in cpu-tegra.c which was introduced
> in commit dc8d966bccde0b8b6c9e8c6e663c747030c17435 which removed

    Please also specify that commit's summary in parens.

> the now obsolete mach/hardware.h from the mach-tegra subtree.

> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> Signed-off-by: Olof Johansson <olof@lixom.net>

WBR, Sergei
