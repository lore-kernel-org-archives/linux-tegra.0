From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/3] ARM: timer: fix checkpatch warnings
Date: Mon, 29 Oct 2012 11:06:36 -0600
Message-ID: <508EB79C.1070805@wwwdotorg.org>
References: <1351016892-21211-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1351016892-21211-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, John Stultz <johnstul@us.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 10/23/2012 12:28 PM, Stephen Warren wrote:
> This prevents checkpatch complaining when this file is moved in a later
> patch.

I have applied patches 1 and 2 to Tegra's tree for 3.8. I'll hold off on
patch 3 for a bit. I need to see if it could benefit from similar rework
that drivers/irqchip recently received from Thomas Petazzoni.
