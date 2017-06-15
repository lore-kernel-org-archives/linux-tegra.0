From: kbuild test robot <fengguang.wu@intel.com>
Subject: [tegra-drm:drm/tegra/for-next 2/20] htmldocs:
 drivers/gpu/host1x/bus.c:50: warning: Excess function parameter 'driver'
 description in 'host1x_subdev_add'
Date: Fri, 16 Jun 2017 00:45:36 +0800
Message-ID: <201706160023.rQsocu8f%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <treding@nvidia.com>
Cc: linux-tegra@vger.kernel.org, kbuild-all@01.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
head:   43240bbd871e2c8f89584d369278a3d18680d9ea
commit: fa6d095eb23a8b1aae78d221879032497f6e457f [2/20] drm/tegra: Add driver documentation
reproduce: make htmldocs

All warnings (new ones prefixed by >>):

   WARNING: convert(1) not found, for SVG to PDF conversion install ImageMagick (https://www.imagemagick.org)
   arch/x86/include/asm/uaccess_32.h:1: warning: no structured comments found
   include/linux/init.h:1: warning: no structured comments found
   include/linux/mod_devicetable.h:686: warning: Excess struct/union/enum/typedef member 'ver_major' description in 'fsl_mc_device_id'
   include/linux/mod_devicetable.h:686: warning: Excess struct/union/enum/typedef member 'ver_minor' description in 'fsl_mc_device_id'
   kernel/sched/core.c:2088: warning: No description found for parameter 'rf'
   kernel/sched/core.c:2088: warning: Excess function parameter 'cookie' description in 'try_to_wake_up_local'
   include/linux/kthread.h:26: warning: Excess function parameter '...' description in 'kthread_create'
   kernel/sys.c:1: warning: no structured comments found
   include/linux/device.h:969: warning: No description found for parameter 'dma_ops'
   drivers/dma-buf/seqno-fence.c:1: warning: no structured comments found
   include/linux/iio/iio.h:597: warning: No description found for parameter 'trig_readonly'
   include/linux/iio/trigger.h:151: warning: No description found for parameter 'indio_dev'
   include/linux/iio/trigger.h:151: warning: No description found for parameter 'trig'
   include/linux/device.h:970: warning: No description found for parameter 'dma_ops'
   include/linux/usb/gadget.h:230: warning: No description found for parameter 'claimed'
   include/linux/usb/gadget.h:230: warning: No description found for parameter 'enabled'
   include/linux/usb/gadget.h:408: warning: No description found for parameter 'quirk_altset_not_supp'
   include/linux/usb/gadget.h:408: warning: No description found for parameter 'quirk_stall_not_supp'
   include/linux/usb/gadget.h:408: warning: No description found for parameter 'quirk_zlp_not_supp'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'set_busid'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'irq_handler'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'irq_preinstall'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'irq_postinstall'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'irq_uninstall'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'debugfs_init'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_open_object'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_close_object'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'prime_handle_to_fd'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'prime_fd_to_handle'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_prime_export'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_prime_import'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_prime_pin'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_prime_unpin'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_prime_res_obj'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_prime_get_sg_table'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_prime_import_sg_table'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_prime_vmap'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_prime_vunmap'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_prime_mmap'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'gem_vm_ops'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'major'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'minor'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'patchlevel'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'name'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'desc'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'date'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'driver_features'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'ioctls'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'num_ioctls'
   include/drm/drm_drv.h:524: warning: No description found for parameter 'fops'
   include/drm/drm_color_mgmt.h:1: warning: no structured comments found
   drivers/gpu/drm/drm_plane_helper.c:403: warning: No description found for parameter 'ctx'
   drivers/gpu/drm/drm_plane_helper.c:404: warning: No description found for parameter 'ctx'
   drivers/gpu/drm/i915/intel_lpe_audio.c:350: warning: No description found for parameter 'dp_output'
   drivers/gpu/drm/i915/intel_lpe_audio.c:350: warning: No description found for parameter 'link_rate'
   drivers/gpu/drm/i915/intel_lpe_audio.c:351: warning: No description found for parameter 'dp_output'
   drivers/gpu/drm/i915/intel_lpe_audio.c:351: warning: No description found for parameter 'link_rate'
>> drivers/gpu/host1x/bus.c:50: warning: Excess function parameter 'driver' description in 'host1x_subdev_add'
   Documentation/core-api/assoc_array.rst:13: WARNING: Enumerated list ends without a blank line; unexpected unindent.
   Documentation/doc-guide/sphinx.rst:126: ERROR: Unknown target name: "sphinx c domain".
   kernel/sched/fair.c:7650: WARNING: Inline emphasis start-string without end-string.
   kernel/time/timer.c:1200: ERROR: Unexpected indentation.
   kernel/time/timer.c:1202: ERROR: Unexpected indentation.
   kernel/time/timer.c:1203: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/wait.h:122: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/wait.h:125: ERROR: Unexpected indentation.
   include/linux/wait.h:127: WARNING: Block quote ends without a blank line; unexpected unindent.
   kernel/time/hrtimer.c:990: WARNING: Block quote ends without a blank line; unexpected unindent.
   kernel/signal.c:322: WARNING: Inline literal start-string without end-string.
   include/linux/iio/iio.h:219: ERROR: Unexpected indentation.
   include/linux/iio/iio.h:220: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/iio/iio.h:226: WARNING: Definition list ends without a blank line; unexpected unindent.
   drivers/iio/industrialio-core.c:638: ERROR: Unknown target name: "iio_val".
   drivers/iio/industrialio-core.c:645: ERROR: Unknown target name: "iio_val".
   drivers/message/fusion/mptbase.c:5051: WARNING: Definition list ends without a blank line; unexpected unindent.
   drivers/tty/serial/serial_core.c:1898: WARNING: Definition list ends without a blank line; unexpected unindent.
   drivers/pci/pci.c:3456: ERROR: Unexpected indentation.
   include/linux/regulator/driver.h:271: ERROR: Unknown target name: "regulator_regmap_x_voltage".
   include/linux/spi/spi.h:370: ERROR: Unexpected indentation.
   drivers/gpu/drm/drm_scdc_helper.c:203: ERROR: Unexpected indentation.
   drivers/gpu/drm/drm_scdc_helper.c:204: WARNING: Block quote ends without a blank line; unexpected unindent.
   drivers/gpu/drm/drm_ioctl.c:690: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/gpu/todo.rst:111: ERROR: Unknown target name: "drm_fb".
   sound/soc/soc-core.c:2670: ERROR: Unknown target name: "snd_soc_daifmt".
   sound/core/jack.c:312: ERROR: Unknown target name: "snd_jack_btn".
   Documentation/usb/typec.rst:116: ERROR: Error in "kernel-doc" directive:
   invalid option block.

vim +50 drivers/gpu/host1x/bus.c

776dc384 Thierry Reding 2013-10-14  34  
776dc384 Thierry Reding 2013-10-14  35  struct host1x_subdev {
776dc384 Thierry Reding 2013-10-14  36  	struct host1x_client *client;
776dc384 Thierry Reding 2013-10-14  37  	struct device_node *np;
776dc384 Thierry Reding 2013-10-14  38  	struct list_head list;
776dc384 Thierry Reding 2013-10-14  39  };
776dc384 Thierry Reding 2013-10-14  40  
776dc384 Thierry Reding 2013-10-14  41  /**
776dc384 Thierry Reding 2013-10-14  42   * host1x_subdev_add() - add a new subdevice with an associated device node
466749f1 Thierry Reding 2017-04-10  43   * @device: host1x device to add the subdevice to
466749f1 Thierry Reding 2017-04-10  44   * @driver: host1x driver
466749f1 Thierry Reding 2017-04-10  45   * @np: device node
776dc384 Thierry Reding 2013-10-14  46   */
776dc384 Thierry Reding 2013-10-14  47  static int host1x_subdev_add(struct host1x_device *device,
776dc384 Thierry Reding 2013-10-14  48  			     struct device_node *np)
776dc384 Thierry Reding 2013-10-14  49  {
776dc384 Thierry Reding 2013-10-14 @50  	struct host1x_subdev *subdev;
776dc384 Thierry Reding 2013-10-14  51  
776dc384 Thierry Reding 2013-10-14  52  	subdev = kzalloc(sizeof(*subdev), GFP_KERNEL);
776dc384 Thierry Reding 2013-10-14  53  	if (!subdev)
776dc384 Thierry Reding 2013-10-14  54  		return -ENOMEM;
776dc384 Thierry Reding 2013-10-14  55  
776dc384 Thierry Reding 2013-10-14  56  	INIT_LIST_HEAD(&subdev->list);
776dc384 Thierry Reding 2013-10-14  57  	subdev->np = of_node_get(np);
776dc384 Thierry Reding 2013-10-14  58  

:::::: The code at line 50 was first introduced by commit
:::::: 776dc38403676f499a73d32e2e7c61eb5b42f736 drm/tegra: Move subdevice infrastructure to host1x

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--FL5UXtIhxfXey3p5
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--FL5UXtIhxfXey3p5--
