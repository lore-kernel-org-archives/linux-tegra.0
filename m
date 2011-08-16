From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] ARM: tegra: Add missing include of linux/erron.h and
	linux/types.h
Date: Tue, 16 Aug 2011 08:19:18 +0300
Message-ID: <20110816051918.GA19435@sapphire.tkos.co.il>
References: <1313471744.5824.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1313471744.5824.2.camel@phoenix>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Axel Lin <axel.lin@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Erik Gilling <konkers@android.com>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi Axel,

On Tue, Aug 16, 2011 at 01:15:44PM +0800, Axel Lin wrote:
> Include linux/erron.h to fix below build error.

s/erron/errno/ here, and in the subject.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
