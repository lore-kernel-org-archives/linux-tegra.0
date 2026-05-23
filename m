Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp [211.125.140.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BB01DF75B;
	Sat, 23 May 2026 03:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.140.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779507273; cv=none; b=W6KytM0CbxybhV8p/OTjNkVX4pVyykPm2VKKSQXlv4049k84xoRZ0QzG3Adi49pL2h2q787JwScvEgdXz5R0NmAqIIFUK5AU1H5VB7zn3BeuiHIifukPFyFGZABAJFy2LeU1rfrHY16lroQACe8tF6aIKyvix89N1ljp4ShJINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779507273; c=relaxed/simple;
	bh=yAHUx9qOBhWRWLyWrle1ZFuyeDrR76+YVL2i8bDyMoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLNukVwwmjayymS/d02t0DUTL69Art6lSKxBxHmqvnI+ZV4FNznJ5HfZqIAyHv80KMUceDBZf5eaeYvRox+IOvgmoC2l7Eo1H1Pf6J9y2zJ4J4rKmY0Guj9RLi75ukl1K3b0F03K14iyLkxELxsltPfIGOiVtSKqFUhXhKxwoCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=CJ34+Ekr; arc=none smtp.client-ip=211.125.140.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="CJ34+Ekr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779507271; x=1811043271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/PI3FmT1/Yi4DE7+lMDULD4fdLB7X6k2BakvtD3RsQA=;
  b=CJ34+EkrdvS8TLCU1GMDd9XiSFGc42qAwqqAJzakA6x4hxJES5TQTyDH
   AauetdpPKtrS0L9E/8IAFRpjLmGFEX2ivinNIgEnITZbPDqOFC60TVrZU
   VsvwAsd3ogR5zeVXjHGgfsIedMFgAw/hcnnrxvJWSB+13XodZyPHKk2k5
   NTEDv819lDKG4a+6NCVw0O+/+tRczdM+eTNzo5Fw2NYxk8vopj/RFOd9V
   grTsucMJB+xgLR4dqU7TEgEh4cDzlj6hQuqV5iYDFL/9XgIgsBY2NQ8Zr
   +hu7RoXUOmnz25Mn5u/iL/bxnPhm7ZKWc3Au2qlssP/pw7jKXp1k/Tb3H
   A==;
X-CSE-ConnectionGUID: W/RIScbkTxKp9xbcw93A8A==
X-CSE-MsgGUID: SSH56JXnQYyCD+s9Irbv0w==
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::6])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 12:24:20 +0900
X-CSE-ConnectionGUID: O/SdfXAXTci1J18nuI/Q/A==
X-CSE-MsgGUID: JQfr130jQ/m+0PdF94fS/g==
X-IronPort-AV: E=Sophos;i="6.24,163,1774278000"; 
   d="scan'208";a="639353636"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob1.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 12:24:18 +0900
Date: Sat, 23 May 2026 12:24:18 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org, Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH v5 2/4] kernel: param: initialize module_kset in a
 pure_initcall
Message-ID: <ahEd4iC-2hqUbMy3@JPC00244420>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-2-705ccc430885@sony.com>
 <a0b17be8-f7dd-4d05-bc6f-28b32d0b0785@suse.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0b17be8-f7dd-4d05-bc6f-28b32d0b0785@suse.com>

Hi Petr,

Thanks for the feedback!

On Fri, May 22, 2026 at 03:06:04PM +0200, Petr Pavlu wrote:
> On 5/18/26 12:19 PM, Shashank Balaji wrote:
> > Commit "driver core: platform: set mod_name in driver registration" will set
> > struct device_driver's mod_name member for platform driver registration. For a
> > driver to be registered with its mod_name set, module_kset needs to be
> > initialized, which currently happens in a subsys_initcall in param_sysfs_init().
> > The tegra cbb drivers register themselves before module_kset init, in a
> > core_initcall. This works currently because lookup_or_create_module_kobject(),
> > which dereferences module_kset via kset_find_obj(), is not called if mod_name
> > is not set, which is the case now.
> > 
> > So in preparation for the commit "driver core: platform: set mod_name in driver registration",
> > move module_kset init to pure_initcall level, ensuring it happens before tegra
> > cbb driver registration.
> > 
> > Suggested-by: Gary Guo <gary@garyguo.net>
> > Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> > ---
> > Patch 4 depends on this patch
> > ---
> >  kernel/params.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/params.c b/kernel/params.c
> > index 74d620bc2521..ac088d4b09a9 100644
> > --- a/kernel/params.c
> > +++ b/kernel/params.c
> > @@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
> >  
> >  	return 0;
> >  }
> > -subsys_initcall(param_sysfs_init);
> > +pure_initcall(param_sysfs_init);
> >  
> >  /*
> >   * param_sysfs_builtin_init - add sysfs version and parameter
> > 
> 
> The change looks ok to me functionality-wise. Sysfs is initialized
> earlier in do_basic_setup() and other code, such as classes_init(),
> calls kset_create_and_add() similarly early.
> 
> One minor issue is that pure_initcall() was originally intended for
> static variable initialization. The file include/linux/init.h says:
> 
> | /*
> |  * A "pure" initcall has no dependencies on anything else, and purely
> |  * initializes variables that couldn't be statically initialized.
> |  *
> |  * This only exists for built-in code, not for modules.
> |  * Keep main.c:initcall_level_names[] in sync.
> |  */
> | #define pure_initcall(fn)		__define_initcall(fn, 0)
> 
> The patch stretches the intended use of pure_initcall() somewhat in this
> regard. However, other code already appears to do the same, so I guess
> this is ok.

Ah yeah, I thought of this too, but it seems like everyone else is doing
it. Linus introduced pure_initcall in b3438f8266cb
("Add "pure_initcall" for static variable initialization") with the
comment, and he introduced another user of it in 140d0b2108fa
("Do 'shm_init_ns()' in an early pure_initcall") which already stretches
the intended use as per the comment.

Given that it's just being used for "run me before core_initcall;
early_initcall is too early for me" without any "pureness" requirements, I
suppose the comment is due for a revision?

> Additionally, I think it would be good to update the comment preceding
> param_sysfs_init(). It currently says:
> 
> | /*
> |  * param_sysfs_init - create "module" kset
> |  *
> |  * This must be done before the initramfs is unpacked and
> |  * request_module() thus becomes possible, because otherwise the
> |  * module load would fail in mod_sysfs_init.
> |  */
> 
> I suggest changing it to something like follows:
> 
> This must be done before any driver registration so that when a driver comes
> from a built-in module, the driver core can add the module under /sys/module
> and create the associated driver symlinks.

Thanks for catching this! I'll add it in the next revision.

Thanks,
Shashank
