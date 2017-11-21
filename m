From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [Nouveau] GP10B regression
Date: Tue, 21 Nov 2017 20:07:41 +0200
Message-ID: <eef8d770-f948-12b3-0749-f1b9a25f231d@kapsi.fi>
References: <343f2346-1a6b-682b-97f3-12d5dd71c856@kapsi.fi>
 <582d1472-1287-0eb2-dcd7-3e48178489b3@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <582d1472-1287-0eb2-dcd7-3e48178489b3-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Anthony Eden <aeden-EfZU8u+QLuPpgkiH4x7ZXw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thanks to Thierry for finding this - applying

index e14643615698..00eeaaffeae5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2369,7 +2369,7 @@ nv13b_chipset = {
         .imem = gk20a_instmem_new,
         .ltc = gp100_ltc_new,
         .mc = gp10b_mc_new,
-       .mmu = gf100_mmu_new,
+       .mmu = gp10b_mmu_new,
         .secboot = gp10b_secboot_new,
         .pmu = gm20b_pmu_new,
         .timer = gk20a_timer_new,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
index 3dcc6bddb32f..470a4fadc165 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
@@ -33,7 +33,7 @@ gp10b_vmm = {
                 { 38, &gp100_vmm_desc_16[3], NVKM_VMM_PAGE_Sxxx },
                 { 29, &gp100_vmm_desc_16[2], NVKM_VMM_PAGE_Sxxx },
                 { 21, &gp100_vmm_desc_16[1], NVKM_VMM_PAGE_SxHC },
-               { 16, &gp100_vmm_desc_16[0], NVKM_VMM_PAGE_SxHC },
+/*             { 16, &gp100_vmm_desc_16[0], NVKM_VMM_PAGE_SxHC },*/
                 { 12, &gp100_vmm_desc_12[0], NVKM_VMM_PAGE_SxHx },
                 {}
         }

on top of next-20171121 works at least for a simple test.

Mikko

On 11/11/2017 03:02 PM, Mikko Perttunen wrote:
> Bisection status report:
> 
> The latest commit I have gotten to work is
> 
> 10842ba074e9 drm/nouveau: remove unused nouveau_fence_work()
> 
> i.e. the first bad commit is
> 
> d7722134b825 drm/nouveau: switch over to new memory and vmm interfaces
> 
> Even with the first one some patches/hacks are needed:
> 
> - in mmu/gp10b.c, in the constructor we need to select the GM200 path - 
> the GP100 path seems to not to work
> 
> - as mentioned in the first mail, we need to set .mmu = gp10b_mmu_new,
> 
> - and in nouveau_mem_memory_target we need to return 
> NVKM_MEM_TARGET_NCOH instead of NVKM_MEM_TARGET_HOST.
> 
> Cheers,
> Mikko
> 
> On 11/10/2017 11:27 PM, Mikko Perttunen wrote:
>> Hello everyone,
>>
>> it seems that GP10B support has regressed recently. With linux-next, I 
>> need to modify device/base.c to set
>>
>>      .mmu = gp10b_mmu_new
>>
>> for GP10B (makes sense - I guess this was left as gf100_mmu_new as a 
>> typo) to probe. After that, running a trivial testcase (running a NOP 
>> method in 3D class) fails with
>>
>> [  110.084649] nouveau 17000000.gpu: fifo: read fault at 0000011000 
>> engine 06 [HOST0] client 06 [GPC0/L1_2] reas|
>> on 02 [PTE] on channel 1 [00f206a000 nouveau_noop_te[2413]] 
>>                                         |
>> [  110.101423] nouveau 17000000.gpu: fifo: channel 1: killed 
>>                                         |
>> [  110.106827] nouveau 17000000.gpu: fifo: runlist 0: scheduled for 
>> recovery                                    |
>> Submitted pushbuffer.                                        |
>> [  110.113867] nouveau 17000000.gpu: nouveau_noop_te[2413]: channel 1 
>> killed!                                   |
>> [  125.084858] nouveau 17000000.gpu: nouveau_noop_te[2413]: failed to 
>> idle channel 1 [nouveau_noop_te[2413]]
>>
>> I haven't managed to track this down yet. However, I did find out that 
>> checking out the drm/nouveau directory at commit 
>> "drm/nouveau/kms/nv50: use the correct state for base channel notifier 
>> setup" makes things work again.
>>
>> I'll continue to take look, though bisecting is a bit harder than 
>> usual due to some other issues in Tegra186 recently, so any pointers 
>> in the right direction would be useful :)
>>
>> Thanks,
>> Mikko
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
