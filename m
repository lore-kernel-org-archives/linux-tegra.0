Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B69938553D;
	Fri, 23 Jan 2026 03:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769138815; cv=none; b=Pgv58CfmjB7AUXBPx8XNmeOKL57jvq+liISvAtz+eQN7dh3h5b8/zCia7rKBZYIthYhsFTyfWD0Ne97ssQOod6zwtzgORUWoLcag3MuR+yKs9WjYmkuZROkUFVsMEZaHCiQyQxV76JgQIKHhQ1n28UFxr4sMBG6vwIkVKUyYkGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769138815; c=relaxed/simple;
	bh=NOXL9m6fEubgub/xwM+k4V/yV9xMOb+Sk90Wkl4s490=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwZiSKnJH4eQ0tjCHMDkrH0BIiDp1zqkmQ9K1Ow3DdWdI0V7JYG8pzrzeTBV8aVTNGEa9S4b8qeiWDvcF6WoPeI9GBm3Bq93/0K+3WhAkn4Ui5eEZBMhj621W+JI6W451WV4AENDmmVUZWnkv3vxWtAey0FBSfvAOM248BQSKs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIH+9N8e; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIH+9N8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769138802; x=1800674802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NOXL9m6fEubgub/xwM+k4V/yV9xMOb+Sk90Wkl4s490=;
  b=iIH+9N8ejOKrMEvqKEKZL/0KgZmWE8VgGrCvlUildyBr1OnWe6VBwGQL
   iRh8YyO0MWKtHy4WzVMQGai7l5SpPgecvnlM+lJ5kSEcr49VNBlW0o2g8
   0nvzJu4x++MjsofySo+I9v59LVP8bMgVbfK73qv5B6uJpoIw8WZ9j/X0X
   B/x69/oIlE3RUfI3guaAj88nwfD507Ks3QnlMRe8P7y9dwL5ZI1Gsnw9i
   zx7qoQBsUdv46Wm3WfqcUi7x3qxnAPda/1YW0jMzmF7c002tn8aFpFIDi
   9i25xDq5tuprgW3cDIN9xpQ69oA66SR36+IfTxoUrkrX9AAl5LFMoZXHt
   A==;
X-CSE-ConnectionGUID: 2IiTU9rRT46qXxocm7gjIA==
X-CSE-MsgGUID: 8XjuIQjFQ+2tT5cdP9WNNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81760966"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81760966"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 19:26:36 -0800
X-CSE-ConnectionGUID: 1UJUUNxqTBO2GGoOwSkStg==
X-CSE-MsgGUID: ri+diFlRRQivG4+m0yc/SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="206960705"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Jan 2026 19:26:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj7oa-00000000TT8-3E5h;
	Fri, 23 Jan 2026 03:26:28 +0000
Date: Fri, 23 Jan 2026 11:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 06/10] dma-buf: heaps: Add support for Tegra VPR
Message-ID: <202601231123.4V5wVUur-lkp@intel.com>
References: <20260122161009.3865888-7-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122161009.3865888-7-thierry.reding@kernel.org>

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20260122]
[cannot apply to drm-misc/drm-misc-next robh/for-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/dt-bindings-reserved-memory-Document-Tegra-VPR/20260123-001244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260122161009.3865888-7-thierry.reding%40kernel.org
patch subject: [PATCH v2 06/10] dma-buf: heaps: Add support for Tegra VPR
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260123/202601231123.4V5wVUur-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231123.4V5wVUur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231123.4V5wVUur-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/heaps/tegra-vpr.c: In function 'tegra_vpr_protect_pages':
   drivers/dma-buf/heaps/tegra-vpr.c:205:21: error: implicit declaration of function '__ptep_get'; did you mean 'ptep_get'? [-Wimplicit-function-declaration]
     205 |         pte_t pte = __ptep_get(ptep);
         |                     ^~~~~~~~~~
         |                     ptep_get
   drivers/dma-buf/heaps/tegra-vpr.c:205:21: error: invalid initializer
   drivers/dma-buf/heaps/tegra-vpr.c:207:15: error: implicit declaration of function 'clear_pte_bit'; did you mean 'clear_ptes'? [-Wimplicit-function-declaration]
     207 |         pte = clear_pte_bit(pte, __pgprot(PROT_NORMAL));
         |               ^~~~~~~~~~~~~
         |               clear_ptes
   In file included from arch/x86/include/asm/paravirt_types.h:11,
                    from arch/x86/include/asm/ptrace.h:175,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/debugfs.h:15,
                    from drivers/dma-buf/heaps/tegra-vpr.c:12:
   drivers/dma-buf/heaps/tegra-vpr.c:207:43: error: 'PROT_NORMAL' undeclared (first use in this function)
     207 |         pte = clear_pte_bit(pte, __pgprot(PROT_NORMAL));
         |                                           ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:202:48: note: in definition of macro '__pgprot'
     202 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/dma-buf/heaps/tegra-vpr.c:207:43: note: each undeclared identifier is reported only once for each function it appears in
     207 |         pte = clear_pte_bit(pte, __pgprot(PROT_NORMAL));
         |                                           ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:202:48: note: in definition of macro '__pgprot'
     202 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/dma-buf/heaps/tegra-vpr.c:208:15: error: implicit declaration of function 'set_pte_bit'; did you mean 'set_pte_at'? [-Wimplicit-function-declaration]
     208 |         pte = set_pte_bit(pte, __pgprot(PROT_DEVICE_nGnRnE));
         |               ^~~~~~~~~~~
         |               set_pte_at
   drivers/dma-buf/heaps/tegra-vpr.c:208:41: error: 'PROT_DEVICE_nGnRnE' undeclared (first use in this function)
     208 |         pte = set_pte_bit(pte, __pgprot(PROT_DEVICE_nGnRnE));
         |                                         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:202:48: note: in definition of macro '__pgprot'
     202 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/dma-buf/heaps/tegra-vpr.c:210:9: error: implicit declaration of function '__set_pte'; did you mean 'set_pte'? [-Wimplicit-function-declaration]
     210 |         __set_pte(ptep, pte);
         |         ^~~~~~~~~
         |         set_pte
   drivers/dma-buf/heaps/tegra-vpr.c: In function 'tegra_vpr_unprotect_pages':
   drivers/dma-buf/heaps/tegra-vpr.c:218:21: error: invalid initializer
     218 |         pte_t pte = __ptep_get(ptep);
         |                     ^~~~~~~~~~
   drivers/dma-buf/heaps/tegra-vpr.c:220:43: error: 'PROT_DEVICE_nGnRnE' undeclared (first use in this function)
     220 |         pte = clear_pte_bit(pte, __pgprot(PROT_DEVICE_nGnRnE));
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:202:48: note: in definition of macro '__pgprot'
     202 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/dma-buf/heaps/tegra-vpr.c:221:41: error: 'PROT_NORMAL' undeclared (first use in this function)
     221 |         pte = set_pte_bit(pte, __pgprot(PROT_NORMAL));
         |                                         ^~~~~~~~~~~
   arch/x86/include/asm/pgtable_types.h:202:48: note: in definition of macro '__pgprot'
     202 | #define __pgprot(x)             ((pgprot_t) { (x) } )
         |                                                ^
   drivers/dma-buf/heaps/tegra-vpr.c: In function 'tegra_vpr_buffer_allocate':
>> drivers/dma-buf/heaps/tegra-vpr.c:612:30: warning: variable 'last' set but not used [-Wunused-but-set-variable]
     612 |         unsigned long first, last;
         |                              ^~~~
>> drivers/dma-buf/heaps/tegra-vpr.c:612:23: warning: variable 'first' set but not used [-Wunused-but-set-variable]
     612 |         unsigned long first, last;
         |                       ^~~~~
   drivers/dma-buf/heaps/tegra-vpr.c: In function 'tegra_vpr_buffer_release':
   drivers/dma-buf/heaps/tegra-vpr.c:695:30: warning: variable 'last' set but not used [-Wunused-but-set-variable]
     695 |         unsigned long first, last;
         |                              ^~~~
   drivers/dma-buf/heaps/tegra-vpr.c:695:23: warning: variable 'first' set but not used [-Wunused-but-set-variable]
     695 |         unsigned long first, last;
         |                       ^~~~~
   drivers/dma-buf/heaps/tegra-vpr.c: In function 'tegra_vpr_setup_chunks':
>> drivers/dma-buf/heaps/tegra-vpr.c:8:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       8 | #define pr_fmt(fmt) "tegra-vpr: " fmt
         |                     ^~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in expansion of macro 'pr_fmt'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:9: note: in expansion of macro '__dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:280:9: note: in expansion of macro '_dynamic_func_call'
     280 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:636:9: note: in expansion of macro 'dynamic_pr_debug'
     636 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/dma-buf/heaps/tegra-vpr.c:1075:17: note: in expansion of macro 'pr_debug'
    1075 |                 pr_debug("  %2u: %pap-%pap (%lu MiB)\n", i, &start, &end,
         |                 ^~~~~~~~
   drivers/dma-buf/heaps/tegra-vpr.c: In function 'tegra_vpr_add_heap':
   drivers/dma-buf/heaps/tegra-vpr.c:1120:30: warning: variable 'last' set but not used [-Wunused-but-set-variable]
    1120 |         unsigned long first, last;
         |                              ^~~~
   drivers/dma-buf/heaps/tegra-vpr.c:1120:23: warning: variable 'first' set but not used [-Wunused-but-set-variable]
    1120 |         unsigned long first, last;
         |                       ^~~~~


vim +/last +612 drivers/dma-buf/heaps/tegra-vpr.c

   605	
   606	static struct tegra_vpr_buffer *
   607	tegra_vpr_buffer_allocate(struct tegra_vpr *vpr, size_t size)
   608	{
   609		unsigned int num_pages = size >> PAGE_SHIFT;
   610		unsigned int order = get_order(size);
   611		struct tegra_vpr_buffer *buffer;
 > 612		unsigned long first, last;
   613		int pageno, err;
   614		pgoff_t i;
   615	
   616		/*
   617		 * "order" defines the alignment and size, so this may result in
   618		 * fragmented memory depending on the allocation patterns. However,
   619		 * since this is used primarily for video frames, it is expected that
   620		 * a number of buffers of the same size will be allocated, so
   621		 * fragmentation should be negligible.
   622		 */
   623		pageno = tegra_vpr_allocate_region(vpr, num_pages, 1);
   624		if (pageno < 0)
   625			return ERR_PTR(pageno);
   626	
   627		first = find_first_bit(vpr->bitmap, vpr->num_pages);
   628		last = find_last_bit(vpr->bitmap, vpr->num_pages);
   629	
   630		buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
   631		if (!buffer) {
   632			err = -ENOMEM;
   633			goto release;
   634		}
   635	
   636		INIT_LIST_HEAD(&buffer->attachments);
   637		INIT_LIST_HEAD(&buffer->list);
   638		mutex_init(&buffer->lock);
   639		buffer->start = vpr->base + (pageno << PAGE_SHIFT);
   640		buffer->limit = buffer->start + size;
   641		buffer->size = size;
   642		buffer->num_pages = num_pages;
   643		buffer->pageno = pageno;
   644		buffer->order = order;
   645	
   646		buffer->pages = kmalloc_array(buffer->num_pages,
   647					      sizeof(*buffer->pages),
   648					      GFP_KERNEL);
   649		if (!buffer->pages) {
   650			err = -ENOMEM;
   651			goto free;
   652		}
   653	
   654		/* track which chunks this buffer overlaps */
   655		if (vpr->num_chunks > 0) {
   656			unsigned int limit = buffer->pageno + buffer->num_pages, i;
   657	
   658			for (i = 0; i < vpr->num_chunks; i++) {
   659				struct tegra_vpr_chunk *chunk = &vpr->chunks[i];
   660	
   661				if (tegra_vpr_chunk_overlaps(chunk, pageno, limit))
   662					set_bit(i, buffer->chunks);
   663			}
   664	
   665			/* activate chunks if necessary */
   666			err = tegra_vpr_activate_chunks(vpr, buffer);
   667			if (err < 0)
   668				goto free;
   669	
   670			/* track first and last allocated pages */
   671			if (buffer->pageno < vpr->first)
   672				vpr->first = buffer->pageno;
   673	
   674			if (limit - 1 > vpr->last)
   675				vpr->last = limit - 1;
   676		}
   677	
   678		for (i = 0; i < buffer->num_pages; i++)
   679			buffer->pages[i] = &vpr->start_page[pageno + i];
   680	
   681		return buffer;
   682	
   683	free:
   684		kfree(buffer->pages);
   685		kfree(buffer);
   686	release:
   687		bitmap_release_region(vpr->bitmap, pageno, order);
   688		return ERR_PTR(err);
   689	}
   690	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
