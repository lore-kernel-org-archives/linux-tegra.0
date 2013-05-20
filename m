From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] ARM: tegra: Add charger subnode to tps65090 node
Date: Mon, 20 May 2013 11:24:23 -0400
Message-ID: <519A4027.2020801@nvidia.com>
References: <1365623505-6309-1-git-send-email-rklein@nvidia.com>
 <5196C3F2.8070204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5196C3F2.8070204@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On 5/17/2013 7:57 PM, Stephen Warren wrote:
> On 04/10/2013 01:51 PM, Rhyland Klein wrote:
>> The charger is now represented by a distinct subnode of the tps65090
>> device. Add this node and enable low current charging with it.
> 
> What's the status of the TPS60590 bindings; are they agreed upon by
> NVIDIA, TI, and SlimLogic yet? In other words, is this patch still
> something I should apply for 3.11, or does it need to be reworked?

I haven't seen any discussion with slimlogic or TI about the tps65090.
As far as I know the bindings for this driver haven't changed.

Laxman, do you think the work on the palmas driver will impact the
design of the bindings for the tps65090?

-rhyland

> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
nvpublic
