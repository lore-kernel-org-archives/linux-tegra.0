From: Embedded Engineer <embed786@gmail.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 20:44:52 +0500
Message-ID: <CA+_ZnZS7WPqA-JbcxjTLhyPOOQ0GTnTDTbxJJgdfcrtsWOuvfQ@mail.gmail.com>
References: <CA+_ZnZTeZLyCcjZduQODzjWxTpU96AefzvTBDFbq2CSjVQxONg@mail.gmail.com>
 <20190305112226.rhbl3dwopmip45ja@shell.armlinux.org.uk>
 <20190305115730.GE26369@ulmo>
 <CA+_ZnZQ1m8QyiMJWwmVvtdqiFRDYK8PocGpG38W0NyEZ3yA8zQ@mail.gmail.com>
 <20190305132350.pzfmz4yvh6ujgotn@shell.armlinux.org.uk>
 <CA+_ZnZS7wimpnH+TnvM_ztnX3wbADpf5FUBd_8igqeg+FnFr5g@mail.gmail.com>
 <20190305142351.ktciqkj5kycdwilr@shell.armlinux.org.uk>
 <CA+_ZnZQhvf5R2f-uMPPO3AgNbXTtoxcqpCYZR_Sb13jHN5X5wA@mail.gmail.com>
 <20190305145853.qsmcaop4ths2jgrl@shell.armlinux.org.uk>
 <CA+_ZnZSTkA8vj4QYJizL=YUcvtiabrVzKtDUPYO+2v-AkgRSpw@mail.gmail.com>
 <20190305153111.frvgnoba646uf5ar@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190305153111.frvgnoba646uf5ar@shell.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Murzin <vladimir.murzin@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 5, 2019 at 8:31 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> Right now, I don't have anything further to add beyond what I've
> already suggested as causes - this is *definitely* memory corruption
> either by something else writing to memory, by the CPU writes not
> properly being stored in RAM or the CPU not being able to reliably
> read data back from RAM.

Thanks alot for your help, I will try updating u-boot to newer version
so that we can eliminate the chance that u-boot has left something on
in undesired state.
