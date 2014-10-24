From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v1 1/5] mfd: tps65910: Convert ti, system-power-controller
 DT property to poweroff-source
Date: Fri, 24 Oct 2014 11:02:40 +0300
Message-ID: <20141024080240.GN32045@tbergstrom-lnx.Nvidia.com>
References: <1413991587-11110-1-git-send-email-romain.perier@gmail.com>
 <20141023081230.GK32045@tbergstrom-lnx.Nvidia.com>
 <CABgxDoKm5kKKCTD1njAerUrM24iVcGRDuhJ7b4qBVPqKBC4ftQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CABgxDoKm5kKKCTD1njAerUrM24iVcGRDuhJ7b4qBVPqKBC4ftQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: PERIER Romain <romain.perier@gmail.com>
Cc: mark.rutland@arm.com, Alexandre Courbot <gnurou@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "pawel.moll" <pawel.moll@arm.com>, ijc+devicetree <ijc+devicetree@hellion.org.uk>, Mark Brown <broonie@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, robh+dt@kernel.org, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 23, 2014 at 11:39:34AM +0200, PERIER Romain wrote:
> Hi Peter,
> 
> 2014-10-23 10:12 GMT+02:00 Peter De Schrijver <pdeschrijver@nvidia.com>:
> > This breaks DT ABI stability right? An existing device tree using ti,system-power-controller won't work anymore after this patch right? I don't think that's acceptable.
> >
> 
> This is why I converted all dts which use "ti,system-power-controller"
> and tps65910/tps65911 to the new property (everything is in the
> patches serie). However, with an existing dtb it will no longer work,
> yes.
> What do you suggest ? keep these two properties in the driver ? :/
> 

Yes. Existing DTs should work with new kernels. So there's no other choice
than leaving support for the existing property in place. Obviously DTs for new
boards can use the new standardized property.

Cheers,

Peter.
