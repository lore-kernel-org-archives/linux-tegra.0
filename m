From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [5/5] ARM: tegra: jetson-tk1: enable GK20A GPU
Date: Thu, 25 Sep 2014 12:07:01 -0600
Message-ID: <542459C5.9060505@wwwdotorg.org>
References: <1400491450-19223-6-git-send-email-acourbot@nvidia.com>
 <20140925132717.GA13579@dusk.luon.net> <54243931.6050804@wwwdotorg.org>
 <20140925164109.GA30382@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140925164109.GA30382@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sjoerd Simons <sjoerd-FGvqe4uplSY@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/25/2014 10:41 AM, Thierry Reding wrote:
> On Thu, Sep 25, 2014 at 09:48:01AM -0600, Stephen Warren wrote:
>> On 09/25/2014 07:27 AM, Sjoerd Simons wrote:
>>> Playing a bit with todays linux-next on my jetson, it seems this patch is
>>> still required for enabling the GPU. Is there anything blocking it (firmware
>>> not available yet in liux-firmware?)
>>
>> I think initially I was waiting for the DRM patch "drm/nouvea: support for
>> probing platform devices" to be applied, but it looks like that's been
>> applied already, so only patches 4 and 5 in this series are still
>> outstanding.
>>
>> Alex, wasn't there also some issue where the VPR register had to be
>> programmed, and if it wasn't there'd be a hang when the GPU registers were
>> touched? If we've added code to Nouveau/tegradrm to detect that and avoid
>> the problem, then I guess we can commit these last two patches for 3.19. A
>> resend after the 3.18 merge window might help.
>
> A patch that programs VPR was merged into U-Boot (though I don't think
> it's made it into master yet). I'm not sure we can reasonably check for
> that in Nouveau, given that the register is somewhere completely
> unrelated. In fact I think the U-Boot patch was triggered by some
> discussion about how to solve this and it was decided that it shouldn't
> be done in the kernel, but U-Boot should set it up.
>
> That said, perhaps one solution would be to make U-Boot enable the gk20a
> device if it's set up the VPR and disable it otherwise?

For that to work, we'd need the DT to say status="disabled" by default 
for the GPU, and for the fixed U-Boot (and indeed every other 
bootloader...) to enable the GPU node. This would allow people with old 
versions of U-Boot (or other bootloaders) to continue to boot. This 
means bootloaders would only have to set status="okay", but never have 
to set status="disabled", which at least simplifies them a tiny bit.
