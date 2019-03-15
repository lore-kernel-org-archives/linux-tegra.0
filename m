From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Fri, 15 Mar 2019 08:55:10 +0000
Message-ID: <89e5f77af850436668c6a9108ed129a9574e2edf.camel@toradex.com>
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
 <CA+_ZnZS7WPqA-JbcxjTLhyPOOQ0GTnTDTbxJJgdfcrtsWOuvfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CA+_ZnZS7WPqA-JbcxjTLhyPOOQ0GTnTDTbxJJgdfcrtsWOuvfQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <C9D6B60BEEA2EF4AB52B0D36E30CE5D9@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "embed786@gmail.com" <embed786@gmail.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>, "vladimir.murzin@arm.com" <vladimir.murzin@arm.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2019-03-05 at 20:44 +0500, Embedded Engineer wrote:
> On Tue, Mar 5, 2019 at 8:31 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> > Right now, I don't have anything further to add beyond what I've
> > already suggested as causes - this is *definitely* memory
> > corruption
> > either by something else writing to memory, by the CPU writes not
> > properly being stored in RAM or the CPU not being able to reliably
> > read data back from RAM.
> 
> Thanks alot for your help, I will try updating u-boot to newer
> version
> so that we can eliminate the chance that u-boot has left something on
> in undesired state.

Sorry, I just saw this thread now. I have quite some TK1 experience
from our Apalis TK1 bring-up. For us mainline U-Boot works quite nicely
but I do remember some magic stuff called RAM repair NVIDIA has done to
their downstream which fixed a strange hang issue we have seen at times
during our extensive validation & verification:

http://git.toradex.com/cgit/u-boot-toradex.git/commit/?h=2016.11-toradex&id=df2b46ba248687c208767865abe5fca32a43faaf
